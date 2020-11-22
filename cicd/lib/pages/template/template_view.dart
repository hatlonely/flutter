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
  var nameController = TextEditingController();
  var categoryController = TextEditingController();
  var descriptionController = TextEditingController();
  var languageController = TextEditingController();
  var scriptController = TextEditingController();

  TextField nameTextField;
  TextField categoryTextField;
  TextField descriptionTextField;
  TextField languageTextField;
  TextField scriptTextField;

  TemplateViewState() {
    nameTextField = TextField(decoration: textFieldDecoration(text: "名字"), controller: nameController, enabled: false);
    categoryTextField = TextField(
      decoration: textFieldDecoration(text: "分类"),
      controller: categoryController,
      enabled: false,
    );
    descriptionTextField = TextField(
      decoration: textFieldDecoration(text: "描述"),
      controller: descriptionController,
      enabled: false,
    );
    languageTextField = TextField(
      decoration: textFieldDecoration(text: "语言"),
      controller: languageController,
      enabled: false,
    );
    scriptTextField = TextField(
      decoration: textFieldDecoration(text: "脚本"),
      minLines: 10,
      maxLines: 20,
      controller: scriptController,
      enabled: false,
    );
  }

  bool editable = false;

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

  void edit() {
    setState(() {
      editable = true;
    });
  }

  void save() {}

  void delete() {}

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RawMaterialButton(
                      fillColor: Colors.white,
                      child: Icon(Icons.save),
                      padding: EdgeInsets.all(5.0),
                      shape: CircleBorder(),
                      onPressed: save,
                    ),
                    const SizedBox(width: 20),
                    RawMaterialButton(
                      fillColor: Colors.white,
                      child: Icon(Icons.edit),
                      padding: EdgeInsets.all(5.0),
                      shape: CircleBorder(),
                      onPressed: edit,
                    ),
                    const SizedBox(width: 20),
                    RawMaterialButton(
                      fillColor: Colors.white,
                      child: Icon(Icons.delete, color: Colors.red),
                      padding: EdgeInsets.all(5.0),
                      shape: CircleBorder(),
                      onPressed: delete,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                editable ? nameTextField : Text(nameController.value.text),
                const SizedBox(height: 20),
                editable ? categoryTextField : Text(categoryController.value.text),
                const SizedBox(height: 20),
                editable ? descriptionTextField : Text(descriptionController.value.text),
                const SizedBox(height: 20),
                editable ? languageTextField : Text(languageController.value.text),
                const SizedBox(height: 20),
                editable ? scriptTextField : Text(scriptController.value.text),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
