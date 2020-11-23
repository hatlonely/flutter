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
  var _nameController = TextEditingController();
  var _categoryController = TextEditingController();
  var _descriptionController = TextEditingController();
  var _languageController = TextEditingController();
  var _scriptController = TextEditingController();
  bool _editable = true;
  final _formKey = GlobalKey<FormState>();

  String validate(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return "不能为空";
    }
    return null;
  }

  void save() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

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
    _nameController.text = template.name;
    _categoryController.text = template.category;
    _descriptionController.text = template.description;
    _languageController.text = template.scriptTemplate.language;
    _scriptController.text = template.scriptTemplate.script;
  }

  api.Template createTemplateByTextEditControllers() {
    var template = api.Template();
    template.name = _nameController.value.text;
    template.description = _descriptionController.value.text;
    template.category = _categoryController.value.text;
    template.type = "script";
    template.scriptTemplate = api.Template_ScriptTemplate();
    template.scriptTemplate.language = _languageController.value.text;
    template.scriptTemplate.script = _scriptController.value.text;
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
                  onPressed: _editable ? save : null,
                  icon: Icons.save,
                ),
                const SizedBox(width: 10),
                CircleIconButton(
                  tooltip: "取消",
                  color: Colors.white,
                  onPressed: _editable ? cancel : null,
                  icon: Icons.cancel,
                ),
              ],
            ),
            const SizedBox(height: 40),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  MyTextField(key: "名字", controller: _nameController, editable: _editable, validator: validate),
                  const SizedBox(height: 20),
                  MyTextField(key: "类别", controller: _categoryController, editable: _editable),
                  const SizedBox(height: 20),
                  MyTextField(key: "描述", controller: _descriptionController, editable: _editable),
                  const SizedBox(height: 20),
                  MyTextField(key: "语言", controller: _languageController, editable: _editable),
                  const SizedBox(height: 20),
                  MyTextField(
                    key: "脚本",
                    controller: _scriptController,
                    minLines: 10,
                    maxLines: 20,
                    editable: _editable,
                  ),
                ],
              ),
            ),
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

class MyTextField extends TextFormField {
  MyTextField({
    TextEditingController controller,
    String key,
    bool editable,
    int minLines,
    int maxLines,
    String Function(String) validator,
  }) : super(
          validator: validator,
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
