import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class TemplatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TemplatePageState();
}

class TemplatePageState extends State<TemplatePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController scriptController = TextEditingController();

  void save() async {
    print("name");
    print(nameController.value.text);
    print(descriptionController.value.text);
    print(languageController.value.text);
    print(scriptController.value.text);
    var httpClient = http.Client();
    var res = await httpClient.post("http://127.0.0.1/v1/task", body: {
      "name": nameController.value.text,
      "description": descriptionController.value.text,
      "language": languageController.value.text,
      "script": scriptController.value.text,
      "type": "script"
    });
    var body = res.body;
    print(body);
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
    print("hello print");

    return Scaffold(
      appBar: AppBar(title: Text("template")),
      body: Center(
        child: SizedBox(
          width: 600,
          // height: 800,
          child: Card(
            margin: EdgeInsets.zero,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: textFieldDecoration(text: "名字"),
                    controller: nameController,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: textFieldDecoration(text: "描述"),
                    controller: descriptionController,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: textFieldDecoration(text: "语言"),
                    controller: languageController,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: textFieldDecoration(text: "脚本"),
                    minLines: 10,
                    maxLines: 20,
                    controller: scriptController,
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RaisedButton(
                        color: Theme.of(context).accentColor,
                        child: Text(
                          "保存",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        onPressed: save,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
