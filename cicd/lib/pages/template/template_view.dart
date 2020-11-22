import 'package:flutter/material.dart';
import 'package:cicd/api/cicd.pb.dart' as api;
import 'package:http/http.dart' as http;
import 'dart:convert';

class TemplateView extends StatefulWidget {
  final String id;
  TemplateView({Key key, this.id}) : super(key: key);

  @override
  State<TemplateView> createState() => TemplateViewState();
}

class TemplateViewState extends State<TemplateView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController scriptController = TextEditingController();

  InputDecoration textFieldDecoration({text: String}) {
    return InputDecoration(
      hintText: text,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(),
      ),
    );
  }

  Future<api.Template> getTemplate() async {
    var httpClient = http.Client();
    var res = await httpClient.get("http://127.0.0.1/v1/template/${widget.id}");
    var template = api.Template();
    template.mergeFromProto3Json(json.decode(res.body));
    return template;
  }

  @override
  Widget build(BuildContext context) {
    var res = getTemplate();
    print(res.then((value) => {print(value)}));

    return FutureBuilder(
      initialData: api.Template(),
      future: getTemplate(),
      builder: (context, value) {
        var res = value.data as api.Template;

        nameController.text = res.name;
        categoryController.text = res.category;
        descriptionController.text = res.description;
        languageController.text = res.scriptTemplate.language;
        scriptController.text = res.scriptTemplate.script;

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
                Text("template", style: Theme.of(context).textTheme.headline5),
                const SizedBox(height: 40),
                TextField(decoration: textFieldDecoration(text: "名字"), controller: nameController, enabled: false),
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
              ],
            ),
          ),
        );
      },
    );
  }
}
