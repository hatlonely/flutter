import 'package:cicd/api/api.dart';
import 'package:cicd/config/config.dart';
import 'package:cicd/pages/template/put_template_view.dart';
import 'package:cicd/pages/template/template_view.dart';
import 'package:flutter/material.dart';

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
  var _templates = <ApiTemplate>[];

  ListTemplateViewState() {
    var client = CICDServiceApi(ApiClient(basePath: Config.CICDEndpoint));
    client.cICDServiceListTemplate(offset: "0", limit: "20").then((res) {
      print(res.toJson());
      setState(() {
        _templates = res.templates;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var cards = _templates.map((e) {
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
              Text(e.name != null ? e.name : ""),
              Text(e.description != null ? e.description : ""),
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
  }
}
