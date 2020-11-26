import 'package:cicd/api/api.dart';
import 'package:cicd/config/config.dart';
import 'package:cicd/pages/task/put_task_view.dart';
import 'package:cicd/pages/task/task_view.dart';
import 'package:cicd/widget/widget.dart';
import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TaskPageState();
}

class TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("task")),
      body: Center(
        child: ListTaskView(),
      ),
    );
  }
}

class ListTaskView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ListTaskViewState();
}

class ListTaskViewState extends State<ListTaskView> {
  var _tasks = <ApiTask>[];

  ListTaskViewState() {
    var client = CICDServiceApi(ApiClient(basePath: Config.CICDEndpoint));
    client.cICDServiceListTask(offset: "0", limit: "20").then((value) {
      setState(() {
        _tasks = value.tasks;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var cards = _tasks.map((e) {
      return GestureDetector(
        onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => TaskViewPage(id: e.id)))},
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(e.name),
              Text(e.description),
            ],
          ),
        ),
      );
    }).toList();

    cards.add(ElementAddCard(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PutTaskViewPage())),
    ));

    return GridView.count(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      crossAxisCount: MediaQuery.of(context).size.width ~/ 300.0,
      childAspectRatio: 1.618,
      children: cards,
    );
  }
}
