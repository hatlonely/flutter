import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:cicd/pages/variable/variable_view.dart';
import 'package:cicd/api/cicd.pb.dart' as api;
import 'package:cicd/pages/variable/put_variable_view.dart';

class VariablePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => VariablePageState();
}

class VariablePageState extends State<VariablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("variable")),
      body: Center(
        child: VariableView(),
      ),
    );
  }
}

class VariableView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => VariableViewState();
}

class VariableViewState extends State<VariableView> {
  Future<api.ListVariableRes> listVariable() async {
    var httpClient = http.Client();
    var res = await httpClient.get("http://127.0.0.1/v1/variable?offset=0&limit=20");

    var listVariableRes = api.ListVariableRes();
    listVariableRes.mergeFromProto3Json(json.decode(res.body));

    return listVariableRes;
  }

  @override
  Widget build(BuildContext context) {
    var res = listVariable();
    print(res.then((value) => {print(value)}));

    return FutureBuilder(
      initialData: api.ListVariableRes(),
      future: listVariable(),
      builder: (context, value) {
        var res = value.data as api.ListVariableRes;
        var cards = <Widget>[];
        for (var tpl in res.variables) {
          cards.add(GestureDetector(
            onTap: () =>
                {Navigator.push(context, MaterialPageRoute(builder: (context) => VariableViewPage(id: tpl.id)))},
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
                  Text(tpl.name),
                  Text(tpl.description),
                ],
              ),
            ),
          ));
        }

        cards.add(GestureDetector(
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => PutVariableViewPage()))},
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
          crossAxisCount: 3,
          childAspectRatio: 1.618,
          children: cards,
        );
      },
    );
  }
}
