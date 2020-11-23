import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:cicd/pages/task/task_view.dart';
import 'package:cicd/api/cicd.pb.dart' as api;
import 'package:cicd/pages/task/put_task_view.dart';

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
  Future<api.ListTaskRes> listTask() async {
    var httpClient = http.Client();
    var res = await httpClient.get("http://127.0.0.1/v1/task?offset=0&limit=20");

    var listTaskRes = api.ListTaskRes();
    listTaskRes.mergeFromProto3Json(json.decode(res.body));

    return listTaskRes;
  }

  @override
  Widget build(BuildContext context) {
    var res = listTask();
    print(res.then((value) => {print(value)}));

    return FutureBuilder(
      initialData: api.ListTaskRes(),
      future: listTask(),
      builder: (context, value) {
        var res = value.data as api.ListTaskRes;
        var cards = res.tasks.map((e) {
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

        cards.add(GestureDetector(
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => PutTaskViewPage()))},
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
                    Icon(Icons.add, size: 60),
                  ],
                ))));

        return GridView.count(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          crossAxisCount: MediaQuery.of(context).size.width ~/ 300.0,
          childAspectRatio: 1.618,
          children: cards,
        );
      },
    );
  }
}
