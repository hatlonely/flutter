import 'package:flutter/material.dart';
import 'package:cicd/api/cicd.pb.dart' as api;
import 'package:http/http.dart' as http;
import 'dart:convert';

class PutTemplateViewPage extends StatelessWidget {
  final String id;
  PutTemplateViewPage({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("put template")),
      body: Center(
        child: PutTemplateView(),
      ),
    );
  }
}

class PutTemplateView extends StatefulWidget {
  @override
  State<PutTemplateView> createState() => PutTemplateViewState();
}

class PutTemplateViewState extends State<PutTemplateView> {
  var nameController = TextEditingController();
  var categoryController = TextEditingController();
  var descriptionController = TextEditingController();
  var languageController = TextEditingController();
  var scriptController = TextEditingController();

  bool editable = true;

  void save() async {
    var cli = http.Client();
    var template = createTemplateByTextEditControllers();

    var res = await cli.post("http://127.0.0.1/v1/template", body: json.encode(template.toProto3Json()));

    if (res.statusCode == 200) {
      Info(context, "插入成功");
    } else {
      Warn(context, "插入失败: ${res.body}");
    }
  }

  void cancel() {
    Navigator.pop(context);
  }

  void setTextEditControllersByTemplate(api.Template template) {
    nameController.text = template.name;
    categoryController.text = template.category;
    descriptionController.text = template.description;
    languageController.text = template.scriptTemplate.language;
    scriptController.text = template.scriptTemplate.script;
  }

  api.Template createTemplateByTextEditControllers() {
    var template = api.Template();
    template.name = nameController.value.text;
    template.description = descriptionController.value.text;
    template.category = categoryController.value.text;
    template.type = "script";
    template.scriptTemplate = api.ScriptTemplate();
    template.scriptTemplate.language = languageController.value.text;
    template.scriptTemplate.script = scriptController.value.text;
    return template;
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleIconButton(
                  tooltip: "保存",
                  color: Colors.white,
                  onPressed: editable ? save : null,
                  icon: Icons.save,
                ),
                const SizedBox(width: 10),
                CircleIconButton(
                  tooltip: "取消",
                  color: Colors.white,
                  onPressed: editable ? cancel : null,
                  icon: Icons.cancel,
                ),
              ],
            ),
            const SizedBox(height: 40),
            MyTextField(key: "名字", controller: nameController, editable: editable),
            const SizedBox(height: 20),
            MyTextField(key: "类别", controller: categoryController, editable: editable),
            const SizedBox(height: 20),
            MyTextField(key: "描述", controller: descriptionController, editable: editable),
            const SizedBox(height: 20),
            MyTextField(key: "语言", controller: languageController, editable: editable),
            const SizedBox(height: 20),
            MyTextField(
              key: "脚本",
              controller: scriptController,
              minLines: 10,
              maxLines: 20,
              editable: editable,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class CircleIconButton extends FlatButton {
  CircleIconButton({
    Function onPressed,
    Color color,
    IconData icon,
    String tooltip,
    Color iconColor,
  }) : super(
          color: color,
          child: Tooltip(message: tooltip, child: Icon(icon, color: iconColor)),
          padding: EdgeInsets.all(15),
          shape: CircleBorder(),
          onPressed: onPressed,
        );
}

class MyTextField extends TextField {
  MyTextField({
    TextEditingController controller,
    String key,
    bool editable,
    int minLines,
    int maxLines,
  }) : super(
          decoration: InputDecoration(
            isDense: true,
            labelText: key,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(),
            ),
          ),
          maxLines: maxLines,
          minLines: minLines,
          controller: controller,
          enabled: editable,
        );
}

void Info(BuildContext context, String message) {
  Scaffold.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.green,
    content: Text(message, style: TextStyle(color: Colors.white)),
  ));
}

void Warn(BuildContext context, String message) {
  Scaffold.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(message, style: TextStyle(color: Colors.white)),
  ));
}

void Trac(BuildContext context, String message) {
  Scaffold.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.blue,
    content: Text(message, style: TextStyle(color: Colors.white)),
  ));
}
