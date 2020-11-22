import 'package:flutter/material.dart';
import 'package:cicd/api/cicd.pb.dart' as api;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'template_view.dart';
import 'put_template_view.dart';

class ListTemplateView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ListTemplateViewState();
}

class ListTemplateViewState extends State<ListTemplateView> {
  Future<api.ListTemplateRes> listTemplate() async {
    var httpClient = http.Client();
    var res = await httpClient.get("http://127.0.0.1/v1/listTemplate?offset=0&limit=20");

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
        var cards = <Widget>[];
        for (var tpl in res.templates) {
          cards.add(GestureDetector(
            onTap: () =>
                {Navigator.push(context, MaterialPageRoute(builder: (context) => TemplateViewPage(id: tpl.id)))},
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
          crossAxisCount: 3,
          childAspectRatio: 1.618,
          children: cards,
        );
      },
    );
  }
}
