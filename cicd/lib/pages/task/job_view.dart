import 'package:cicd/api/api.dart';
import 'package:cicd/config/config.dart';
import 'package:flutter/material.dart';

class JobViewPage extends StatelessWidget {
  final String id;
  JobViewPage({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("job")),
      body: Center(
        child: JobView(id: id),
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
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(40.0),
        child: Column(children: [
          Text(_job.id ?? ""),
          const SizedBox(height: 20),
          Text(_job.taskID ?? ""),
          const SizedBox(height: 20),
          Text(_job.status ?? ""),
          const SizedBox(height: 20),
          Text(_job.createAt == null
              ? "unknown"
              : DateTime.fromMillisecondsSinceEpoch(_job.createAt * 1000).toIso8601String()),
          const SizedBox(height: 20),
          Text(_job.updateAt == null
              ? "unknown"
              : DateTime.fromMillisecondsSinceEpoch(_job.createAt * 1000).toIso8601String()),
          const SizedBox(height: 20),
          ..._job.subs?.map((e) => Text(e.stdout))
        ]),
      ),
    );
  }
}
