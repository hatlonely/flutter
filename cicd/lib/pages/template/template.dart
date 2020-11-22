import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:cicd/api/cicd.pb.dart' as api;
import 'template_view.dart';

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
        child: TemplateView(id: "5fb914c60ed06f871ea7d87d"),
//        child: ListTemplateView(),
      ),
    );
  }
}

class PutTemplateCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PutTemplateCardState();
}

class PutTemplateCardState extends State<PutTemplateCard> {
  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController scriptController = TextEditingController();

  void putTemplate() async {
    var httpClient = http.Client();
    var res = await httpClient.post("http://127.0.0.1/v1/template",
        body: json.encode({
          "name": nameController.value.text,
          "description": descriptionController.value.text,
          "type": "script",
          "category": categoryController.value.text,
          "scriptTemplate": {
            "language": languageController.value.text,
            "script": scriptController.value.text,
          }
        }));

    if (res.statusCode == 200) {
      Scaffold.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green,
        content: Text("保存成功", style: TextStyle(color: Colors.white)),
      ));
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text(res.body, style: TextStyle(color: Colors.white)),
      ));
    }
  }

  InputDecoration textFieldDecoration({text: String}) {
    return InputDecoration(
      hintText: text,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("新增模板", style: Theme.of(context).textTheme.headline5),
            const SizedBox(height: 40),
            TextField(decoration: textFieldDecoration(text: "名字"), controller: nameController),
            const SizedBox(height: 20),
            TextField(decoration: textFieldDecoration(text: "分类"), controller: categoryController),
            const SizedBox(height: 20),
            TextField(decoration: textFieldDecoration(text: "描述"), controller: descriptionController),
            const SizedBox(height: 20),
            TextField(decoration: textFieldDecoration(text: "语言"), controller: languageController),
            const SizedBox(height: 20),
            TextField(
              decoration: textFieldDecoration(text: "脚本"),
              minLines: 10,
              maxLines: 20,
              controller: scriptController,
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  color: Theme.of(context).accentColor,
                  child: Text("保存", style: TextStyle(color: Colors.white)),
                  onPressed: putTemplate,
                ),
                const SizedBox(width: 100),
                RaisedButton(
                  color: Theme.of(context).accentColor,
                  child: Text("取消", style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
