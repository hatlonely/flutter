import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:cicd/pages/template/template_view.dart';
import 'package:cicd/api/cicd.pb.dart' as api;
import 'package:cicd/pages/template/put_template_view.dart';

class TemplatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TemplatePageState();
}

class TemplatePageState extends State<TemplatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("template")),
      body: Center(
        child: ListTemplateView(),
      ),
    );
  }
}

class ListTemplateView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ListTemplateViewState();
}

class ListTemplateViewState extends State<ListTemplateView> {
  Future<api.ListTemplateRes> listTemplate() async {
    var httpClient = http.Client();
    var res = await httpClient.get("http://127.0.0.1/v1/template?offset=0&limit=20");

    var listTemplateRes = api.ListTemplateRes();
    listTemplateRes.mergeFromProto3Json(json.decode(res.body));

    return listTemplateRes;
  }

  @override
  Widget build(BuildContext context) {
    var res = listTemplate();
    print(res.then((value) => {print(value)}));

    return FutureBuilder(
      initialData: api.ListTemplateRes(),
      future: listTemplate(),
      builder: (context, value) {
        var res = value.data as api.ListTemplateRes;
        var cards = res.templates.map((e) {
          return GestureDetector(
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => TemplateViewPage(id: e.id)))},
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
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => PutTemplateViewPage()))},
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
