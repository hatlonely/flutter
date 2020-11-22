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

  bool editable = false;
  var template = api.Template();

  TextField textField({String name, TextEditingController controller, bool enabled}) {
    return TextField(
      decoration: textFieldDecoration(text: name),
      controller: controller,
      enabled: enabled,
    );
  }

  InputDecoration textFieldDecoration({text: String}) {
    return InputDecoration(
      hintText: text,
      isDense: true,
      prefix: Text("$text: "),
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

  void save() async {
    var cli = http.Client();
    var template = api.Template();
    template.id = widget.id;
    template.name = nameController.value.text;
    template.description = descriptionController.value.text;
    template.category = categoryController.value.text;
    template.type = "script";
    template.scriptTemplate = api.ScriptTemplate();
    template.scriptTemplate.language = languageController.value.text;
    template.scriptTemplate.script = scriptController.value.text;

    if (this.template == template) {
      Scaffold.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.blue,
        content: Text("无需更新", style: TextStyle(color: Colors.white)),
      ));
      return;
    }

    var res = await cli.put("http://127.0.0.1/v1/template/${widget.id}", body: json.encode(template.toProto3Json()));

    if (res.statusCode == 200) {
      Scaffold.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green,
        content: Text("更新成功", style: TextStyle(color: Colors.white)),
      ));
      setState(() {
        editable = false;
      });
      this.template = template;
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text(res.body, style: TextStyle(color: Colors.white)),
      ));
    }
  }

  void cancel() {
    setController(this.template);
    setState(() {
      editable = false;
    });
  }

  void delete() {}

  void setController(api.Template template) {
    nameController.text = template.name;
    categoryController.text = template.category;
    descriptionController.text = template.description;
    languageController.text = template.scriptTemplate.language;
    scriptController.text = template.scriptTemplate.script;
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
        this.template = res;

        setController(res);

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
                    CircleIconButton(tooltip: "保存", color: Colors.white, onPressed: save, icon: Icons.save),
                    const SizedBox(width: 10),
                    CircleIconButton(tooltip: "编辑", color: Colors.white, onPressed: edit, icon: Icons.edit),
                    const SizedBox(width: 10),
                    CircleIconButton(tooltip: "取消", color: Colors.white, onPressed: cancel, icon: Icons.cancel),
                    const SizedBox(width: 10),
                    CircleIconButton(
                        tooltip: "删除",
                        color: Colors.white,
                        onPressed: delete,
                        icon: Icons.delete,
                        iconColor: Colors.red),
                  ],
                ),
                const SizedBox(height: 40),
                TextField(decoration: textFieldDecoration(text: "名字"), controller: nameController, enabled: editable),
                const SizedBox(height: 20),
                TextField(
                  decoration: textFieldDecoration(text: "类别"),
                  controller: categoryController,
                  enabled: editable,
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: textFieldDecoration(text: "描述"),
                  controller: descriptionController,
                  enabled: editable,
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: textFieldDecoration(text: "语言"),
                  controller: languageController,
                  enabled: editable,
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: textFieldDecoration(text: "脚本"),
                  controller: scriptController,
                  minLines: 10,
                  maxLines: 20,
                  enabled: editable,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CircleIconButton extends RawMaterialButton {
  CircleIconButton({Function onPressed, Color color, IconData icon, String tooltip, Color iconColor})
      : super(
          fillColor: color,
          child: Tooltip(message: tooltip, child: Icon(icon, color: iconColor)),
          padding: EdgeInsets.all(5.0),
          shape: CircleBorder(),
          onPressed: onPressed,
        );
}
