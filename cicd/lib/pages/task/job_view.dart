import 'package:cicd/api/api.dart';
import 'package:cicd/config/config.dart';
import 'package:cicd/widget/widget.dart';
import 'package:flutter/material.dart';

class JobViewPage extends StatelessWidget {
  final String id;
  JobViewPage({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Job 详情")),
      body: Center(
        child: ListView(children: [JobView(id: id)]),
      ),
    );
  }
}

class JobView extends StatefulWidget {
  final String id;
  JobView({Key key, this.id}) : super(key: key);

  @override
  State<JobView> createState() => JobViewState(id: id);
}

class JobViewState extends State<JobView> {
  final String id;

  var _job = ApiJob();

  JobViewState({this.id}) {
    var client = CICDServiceApi(ApiClient(basePath: Config.CICDEndpoint));
    client.cICDServiceGetJob(id).then((res) => setState(() => _job = res));
  }

  @override
  Widget build(BuildContext context) {
    print(_job.toJson());
    return Padding(
      padding: EdgeInsets.all(40.0),
      child: Column(children: [
        Text(_job.taskName ?? "", style: Theme.of(context).textTheme.headline5),
        const SizedBox(height: 20),
        Text("任务状态 ${_job.status ?? ""}"),
        const SizedBox(height: 20),
        Text(
            "创建时间 ${_job.createAt == null ? "unknown" : DateTime.fromMillisecondsSinceEpoch(_job.createAt * 1000).toIso8601String()}"),
        const SizedBox(height: 20),
        Text(
            "最后更新 ${_job.updateAt == null ? "unknown" : DateTime.fromMillisecondsSinceEpoch(_job.createAt * 1000).toIso8601String()}"),
        const SizedBox(height: 20),
        ...(_job.subs ?? []).map(
          (e) => SizedBox(
            width: 600,
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              elevation: 2,
              child: Column(
                children: [
                  Text(
                      "${e.templateName} 语言: ${e.language ?? ""} 退出码: ${e.exitCode == null ? "0" : e.exitCode.toString()} 状态: ${e.status ?? ""}"),
                  const SizedBox(height: 20),
                  CodeView(
                    width: 600,
                    title: "script",
                    code: e.script,
                    language: e.language,
                  ),
                  const SizedBox(height: 20),
                  e.stdout == null
                      ? null
                      : CodeView(
                          width: 600,
                          title: "stdout",
                          code: e.stdout ?? "",
                          language: "txt",
                        ),
                  const SizedBox(height: 20),
                  e.stderr == null
                      ? null
                      : CodeView(
                          width: 600,
                          title: "stderr",
                          code: e.stderr ?? "",
                          language: "txt",
                        ),
                ].where((element) => element != null)?.toList(),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
