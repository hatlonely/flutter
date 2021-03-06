import 'dart:math';

import 'package:cicd/api/api.dart';
import 'package:cicd/config/config.dart';
import 'package:cicd/timex/timex.dart';
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
    refresh();
  }

  void refresh() {
    var client = CICDServiceApi(ApiClient(basePath: Config.CICDEndpoint));
    client.cICDServiceGetJob(id).then((res) => setState(() => _job = res));
  }

  @override
  Widget build(BuildContext context) {
    var maxWidth = min(MediaQuery.of(context).size.width - 80, 800);
    print(_job.toJson());
    return Center(
      child: Container(
        width: maxWidth + 80,
        child: Padding(
          padding: EdgeInsets.all(40.0),
          child: Column(
              children: [
            Text("${_job.taskName ?? ""} #${_job.seq}", style: Theme.of(context).textTheme.headline5),
            const SizedBox(height: 20),
            Text(
              "创建时间 ${_job.createAt == null ? "unknown" : DateTime.fromMillisecondsSinceEpoch(_job.createAt * 1000).toHumanString()}  "
              "最后更新 ${_job.updateAt == null ? "unknown" : DateTime.fromMillisecondsSinceEpoch(_job.updateAt * 1000).toHumanString()}",
              style: TextStyle(fontSize: 12),
            ),
            CircleIconButton(
              color: Colors.pink,
              tooltip: "刷新",
              onPressed: refresh,
              icon: Icons.refresh,
            ),
            _job.error != null ? const SizedBox(height: 20) : null,
            _job.error != null
                ? CodeView(
                    width: maxWidth,
                    code: _job.error,
                    language: "txt",
                    borderColor: Colors.red,
                  )
                : null,
            const SizedBox(height: 20),
            ...(_job.subs ?? []).map(
              (e) => SizedBox(
                width: maxWidth,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: e.status == "Finish"
                            ? Colors.green
                            : e.status == "Failed"
                                ? Colors.red
                                : Colors.yellow,
                        width: 1.0),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  elevation: 0,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${e.templateName}", style: Theme.of(context).textTheme.subtitle2),
                            e.status == "Finish" || e.status == "Failed"
                                ? Text("退出码: ${e.exitCode == null ? "0" : e.exitCode.toString()}")
                                : null,
                          ].where((element) => element != null).toList(),
                        ),
                        const SizedBox(height: 20),
                        CodeView(
                          width: maxWidth,
                          code: e.script,
                          language: e.language,
                        ),
                        e.stdout == null ? null : const SizedBox(height: 20),
                        e.stdout == null
                            ? null
                            : CodeView(
                                width: maxWidth,
                                code: e.stdout ?? "",
                                language: "txt",
                                borderColor: Colors.green,
                              ),
                        e.stderr == null ? null : const SizedBox(height: 20),
                        e.stderr == null
                            ? null
                            : CodeView(
                                width: maxWidth,
                                code: e.stderr ?? "",
                                language: "txt",
                                borderColor: Colors.red,
                              ),
                      ].where((element) => element != null)?.toList(),
                    ),
                  ),
                ),
              ),
            ),
          ].where((element) => element != null).toList()),
        ),
      ),
    );
  }
}
