import 'dart:convert';

import 'package:cicd/api/cicd.pb.dart' as api;
import 'package:cicd/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PutTaskViewPage extends StatelessWidget {
  final String id;
  PutTaskViewPage({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("put task")),
      body: Center(
        child: PutTaskView(),
      ),
    );
  }
}

class PutTaskView extends StatefulWidget {
  @override
  State<PutTaskView> createState() => PutTaskViewState();
}

class PutTaskViewState extends State<PutTaskView> {
  var _nameController = TextEditingController();
  var _descriptionController = TextEditingController();
  bool _editable = true;
  final _formKey = GlobalKey<FormState>();

  var _task = api.Task();

  List<api.Template> _templates = ["Food", "Transport", "Personal", "Shopping", "Medical"].map((e) {
    var tpl = api.Template();
    tpl.id = e;
    tpl.name = e;
    return tpl;
  }).toList();

  var _variables = <api.Variable>[];

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
    var task = createTaskByTextEditControllers();
    var res = await cli.post("http://127.0.0.1/v1/task", body: json.encode(task.toProto3Json()));
    if (res.statusCode == 200) {
      Info(context, "插入成功");
    } else {
      Warn(context, "插入失败: ${res.body}");
    }
  }

  void cancel() {
    Navigator.pop(context);
  }

  void setTextEditControllersByTask(api.Task task) {
    _nameController.text = task.name;
    _descriptionController.text = task.description;
  }

  api.Task createTaskByTextEditControllers() {
    var task = api.Task();
    task.name = _nameController.value.text;
    task.description = _descriptionController.value.text;
    return task;
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyTextField(key: "名字", controller: _nameController, editable: _editable, validator: validate),
                  const SizedBox(height: 20),
                  MyTextField(key: "描述", controller: _descriptionController, editable: _editable),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Wrap(
                      spacing: 20,
                      children: [
                        Text("variables", style: TextStyle(fontSize: 20)),
                        ..._templates.map(
                          (e) => Chip(
                            label: Text(e.name),
                            deleteIcon: Icon(Icons.close, size: 10),
                            onDeleted: () {
                              setState(() {
                                _templates.removeWhere((tpl) => tpl.name == e.name);
                                print("[${e.name}] hello");
                                print(_templates);
                              });
                            },
                          ),
                        ),
                        DropdownButton(
                          isDense: true,
                          icon: const Chip(label: Icon(Icons.add, size: 24)),
                          onChanged: (String value) {
                            setState(() {
                              var template = api.Template();
                              template.name = value;
                              _templates.add(template);
                            });
                          },
                          items: <String>['One', 'Two', 'Free', 'Four'].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
