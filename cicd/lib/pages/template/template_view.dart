import 'package:flutter/material.dart';
import 'package:cicd/api/cicd.pb.dart' as api;
import 'package:http/http.dart' as http;
import 'dart:convert';

class TemplateViewPage extends StatelessWidget {
  final String id;
  TemplateViewPage({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("template")),
      body: Center(
        child: TemplateView(id: this.id),
      ),
    );
  }
}

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
    var template = createTemplateByTextEditControllers();

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
    setTextEditControllersByTemplate(this.template);
    setState(() {
      editable = false;
    });
  }

  void delete() {}

  void setTextEditControllersByTemplate(api.Template template) {
    nameController.text = template.name;
    categoryController.text = template.category;
    descriptionController.text = template.description;
    languageController.text = template.scriptTemplate.language;
    scriptController.text = template.scriptTemplate.script;
  }

  api.Template createTemplateByTextEditControllers() {
    var template = api.Template();
    template.id = widget.id;
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
    var res = getTemplate();
    print(res.then((value) => {print(value)}));

    return FutureBuilder(
      initialData: api.Template(),
      future: getTemplate(),
      builder: (context, value) {
        var res = value.data as api.Template;
        this.template = res;

        setTextEditControllersByTemplate(res);

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
                      tooltip: "编辑",
                      color: Colors.white,
                      onPressed: editable ? null : edit,
                      icon: Icons.edit,
                    ),
                    const SizedBox(width: 10),
                    CircleIconButton(
                      tooltip: "取消",
                      color: Colors.white,
                      onPressed: editable ? cancel : null,
                      icon: Icons.cancel,
                    ),
                    const SizedBox(width: 10),
                    CircleIconButton(
                        tooltip: "删除",
                        color: Colors.white,
                        onPressed: editable ? null : delete,
                        icon: Icons.delete,
                        iconColor: Colors.red),
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
      },
    );
  }
}

class CircleIconButton extends FlatButton {
  CircleIconButton({Function onPressed, Color color, IconData icon, String tooltip, Color iconColor})
      : super(
          color: color,
          child: Tooltip(message: tooltip, child: Icon(icon, color: iconColor)),
          padding: EdgeInsets.all(15),
          shape: CircleBorder(),
          onPressed: onPressed,
        );
}

class MyTextField extends TextField {
  MyTextField({TextEditingController controller, String key, bool editable, int minLines, int maxLines})
      : super(
          decoration: InputDecoration(
            isDense: true,
            prefix: Text("$key: "),
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
