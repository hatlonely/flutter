import 'package:flutter/material.dart';
import 'package:cicd/api/cicd.pb.dart' as api;
import 'package:http/http.dart' as http;
import 'dart:convert';

class VariableViewPage extends StatelessWidget {
  final String id;
  VariableViewPage({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("variable")),
      body: Center(
        child: VariableView(id: this.id),
      ),
    );
  }
}

class VariableView extends StatefulWidget {
  final String id;
  VariableView({Key key, this.id}) : super(key: key);

  @override
  State<VariableView> createState() => VariableViewState();
}

class VariableViewState extends State<VariableView> {
  var nameController = TextEditingController();
  var descriptionController = TextEditingController();
  var kvsController = TextEditingController();

  bool editable = false;
  var variable = api.Variable();

  final _formKey = GlobalKey<FormState>();

  String validate(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return "不能为空";
    }
    return null;
  }

  Future<api.Variable> getVariable() async {
    var httpClient = http.Client();
    var res = await httpClient.get("http://127.0.0.1/v1/variable/${widget.id}");
    var variable = api.Variable();
    variable.mergeFromProto3Json(json.decode(res.body));
    return variable;
  }

  void edit() {
    setState(() {
      editable = true;
    });
  }

  void save() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    var cli = http.Client();
    var variable = createVariableByTextEditControllers();
    if (this.variable == variable) {
      Trac(context, "无需更新");
      return;
    }

    var res = await cli.put("http://127.0.0.1/v1/variable/${widget.id}", body: json.encode(variable.toProto3Json()));
    if (res.statusCode == 200) {
      Info(context, "更新成功");
      setState(() {
        editable = false;
      });
      this.variable = variable;
    } else {
      Warn(context, "更新失败: ${res.body}");
    }
  }

  void delete() async {
    var cli = http.Client();
    var res = await cli.delete("http://127.0.0.1/v1/variable/${widget.id}");
    if (res.statusCode == 200) {
      Info(context, "删除成功");
      Navigator.pop(context);
    } else {
      Warn(context, "删除失败: ${res.body}");
    }
  }

  void cancel() {
    setTextEditControllersByVariable(this.variable);
    setState(() {
      editable = false;
    });
  }

  void setTextEditControllersByVariable(api.Variable variable) {
    nameController.text = variable.name;
    descriptionController.text = variable.description;
    kvsController.text = variable.kvs;
  }

  api.Variable createVariableByTextEditControllers() {
    var variable = api.Variable();
    variable.id = widget.id;
    variable.name = nameController.value.text;
    variable.description = descriptionController.value.text;
    variable.kvs = kvsController.value.text;
    return variable;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: api.Variable(),
      future: getVariable(),
      builder: (context, value) {
        var res = value.data as api.Variable;
        this.variable = res;

        setTextEditControllersByVariable(res);

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
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      MyTextField(key: "名字", controller: nameController, editable: editable, validator: validate),
                      const SizedBox(height: 20),
                      MyTextField(key: "描述", controller: descriptionController, editable: editable),
                      const SizedBox(height: 20),
                      MyTextField(
                        key: "键值",
                        controller: kvsController,
                        minLines: 10,
                        maxLines: 20,
                        editable: editable,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
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
