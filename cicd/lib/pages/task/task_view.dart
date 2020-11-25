import 'dart:convert';

import 'package:cicd/api/cicd.pb.dart' as api;
import 'package:cicd/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TaskViewPage extends StatelessWidget {
  final String id;
  TaskViewPage({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("task")),
      body: Center(
        child: TaskView(id: this.id),
      ),
    );
  }
}

class TaskView extends StatefulWidget {
  final String id;
  TaskView({Key key, this.id}) : super(key: key);

  @override
  State<TaskView> createState() => TaskViewState(id: id);
}

class TaskViewState extends State<TaskView> {
  final String id;
  var _nameController = TextEditingController();
  var _descriptionController = TextEditingController();
  bool _editable = true;
  final _formKey = GlobalKey<FormState>();

  var _task = api.Task();

  var _templates = <api.Template>[];
  var _variables = <api.Variable>[];
  var _allTemplates = <api.Template>[];
  var _allVariables = <api.Variable>[];

  TaskViewState({this.id}) {
    getTask().then((value) {
      _task = value;
      listTemplate().then(
        (value) => setState(() {
          _allTemplates = value.templates;
          _templates = _allTemplates.where((element) => _task.templateIDs.contains(element.id)).toList();
          _allTemplates.removeWhere((element) => _task.templateIDs.contains(element.id));
        }),
      );

      listVariable().then(
        (value) => setState(() {
          _allVariables = value.variables;
          _variables = _allVariables.where((element) => _task.variableIDs.contains(element.id)).toList();
          _allVariables.removeWhere((element) => _task.variableIDs.contains(element.id));
        }),
      );
    });
  }

  String validate(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return "不能为空";
    }
    return null;
  }

  Future<api.Task> getTask() async {
    var httpClient = http.Client();
    var res = await httpClient.get("http://127.0.0.1/v1/task/$id");
    var task = api.Task();
    task.mergeFromProto3Json(json.decode(res.body));
    return task;
  }

  Future<api.ListTemplateRes> listTemplate() async {
    var httpClient = http.Client();
    var res = await httpClient.get("http://127.0.0.1/v1/template?offset=0&limit=20");
    var listTemplateRes = api.ListTemplateRes();
    listTemplateRes.mergeFromProto3Json(json.decode(res.body));
    return listTemplateRes;
  }

  Future<api.ListVariableRes> listVariable() async {
    var httpClient = http.Client();
    var res = await httpClient.get("http://127.0.0.1/v1/variable?offset=0&limit=20");
    var listVariableRes = api.ListVariableRes();
    listVariableRes.mergeFromProto3Json(json.decode(res.body));
    return listVariableRes;
  }

  void edit() {
    setState(() {
      _editable = true;
    });
  }

  void save() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    var cli = http.Client();
    var task = createTaskByTextEditControllers();
    if (_task == task) {
      Trac(context, "无需更新");
      return;
    }

    var res = await cli.put("http://127.0.0.1/v1/task/$id", body: json.encode(task.toProto3Json()));
    if (res.statusCode == 200) {
      Info(context, "更新成功");
      setState(() {
        _editable = false;
      });
      _task = task;
    } else {
      Warn(context, "更新失败: ${res.body}");
    }
  }

  void delete() async {
    var cli = http.Client();
    var res = await cli.delete("http://127.0.0.1/v1/task/$id");
    if (res.statusCode == 200) {
      Info(context, "删除成功");
      Navigator.pop(context);
    } else {
      Warn(context, "删除失败: ${res.body}");
    }
  }

  void cancel() {
    setTextEditControllersByTask(_task);
    setState(() {
      _editable = false;
    });
  }

  void setTextEditControllersByTask(api.Task task) {
    _nameController.text = task.name;
    _descriptionController.text = task.description;
    _allTemplates.addAll(_templates);
    _templates = _allTemplates.where((element) => _task.templateIDs.contains(element.id)).toList();
    _allTemplates.removeWhere((element) => _task.templateIDs.contains(element.id));
    _allVariables.addAll(_variables);
    _variables = _allVariables.where((element) => _task.variableIDs.contains(element.id)).toList();
    _allVariables.removeWhere((element) => _task.variableIDs.contains(element.id));
  }

  api.Task createTaskByTextEditControllers() {
    var task = api.Task();
    task.id = widget.id;
    task.name = _nameController.value.text;
    task.description = _descriptionController.value.text;
    task.variableIDs.addAll(_variables.map((e) => e.id));
    task.templateIDs.addAll(_templates.map((e) => e.id));
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
                  tooltip: "编辑",
                  color: Colors.white,
                  onPressed: _editable ? null : edit,
                  icon: Icons.edit,
                ),
                const SizedBox(width: 10),
                CircleIconButton(
                  tooltip: "取消",
                  color: Colors.white,
                  onPressed: _editable ? cancel : null,
                  icon: Icons.cancel,
                ),
                const SizedBox(width: 10),
                CircleIconButton(
                    tooltip: "删除",
                    color: Colors.white,
                    onPressed: _editable ? null : delete,
                    icon: Icons.delete,
                    iconColor: Colors.red),
              ],
            ),
            const SizedBox(height: 40),
            Form(
              key: _formKey,
              child: Column(
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
                        Padding(padding: EdgeInsets.all(6), child: Text("变量")),
                        ..._variables.map(
                          (e) => Padding(
                            padding: EdgeInsets.all(6),
                            child: Chip(
                              label: Text(e.name),
                              deleteIcon: Icon(Icons.close, size: 10),
                              onDeleted: () {
                                setState(() {
                                  _allVariables.addAll(_variables.where((element) => element.name == e.name));
                                  _variables.removeWhere((element) => element.name == e.name);
                                  print("[${e.name}] hello");
                                  print(_variables);
                                });
                              },
                            ),
                          ),
                        ),
                        PopupMenuButton<api.Variable>(
                          tooltip: "添加变量",
                          padding: EdgeInsets.zero,
                          offset: Offset.zero,
                          enabled: _editable,
                          icon: Container(
                            padding: EdgeInsets.zero,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.add, size: 24.0),
                          ),
                          onSelected: (api.Variable value) {
                            setState(() {
                              _variables.add(value);
                              _allVariables.removeWhere((element) => element.name == value.name);
                            });
                          },
                          itemBuilder: (BuildContext context) =>
                              _allVariables.map<PopupMenuEntry<api.Variable>>((api.Variable value) {
                            return PopupMenuItem<api.Variable>(
                              value: value,
                              child: Text(value.name),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Wrap(
                      spacing: 20,
                      children: [
                        Padding(padding: EdgeInsets.all(6), child: Text("模板")),
                        ..._templates.map(
                          (e) => Padding(
                            padding: EdgeInsets.all(6),
                            child: Chip(
                              label: Text(e.name),
                              deleteIcon: Icon(Icons.close, size: 10),
                              onDeleted: () {
                                setState(() {
                                  _allTemplates.addAll(_templates.where((element) => element.name == e.name));
                                  _templates.removeWhere((element) => element.name == e.name);
                                  print("[${e.name}] hello");
                                  print(_templates);
                                });
                              },
                            ),
                          ),
                        ),
                        PopupMenuButton<api.Template>(
                          tooltip: "添加模板",
                          padding: EdgeInsets.zero,
                          offset: Offset.zero,
                          enabled: _editable,
                          icon: Container(
                            padding: EdgeInsets.zero,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.add, size: 24.0),
                          ),
                          onSelected: (api.Template value) {
                            setState(() {
                              _templates.add(value);
                              _allTemplates.removeWhere((element) => element.name == value.name);
                            });
                          },
                          itemBuilder: (BuildContext context) =>
                              _allTemplates.map<PopupMenuEntry<api.Template>>((api.Template value) {
                            return PopupMenuItem<api.Template>(
                              value: value,
                              child: Text(value.name),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
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
