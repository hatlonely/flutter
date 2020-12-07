import 'dart:math';

import 'package:cicd/api/api.dart';
import 'package:cicd/config/config.dart';
import 'package:cicd/pages/task/job_view.dart';
import 'package:cicd/pages/task/task.dart';
import 'package:cicd/validator/validator.dart';
import 'package:cicd/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskViewPage extends StatelessWidget {
  final String id;
  TaskViewPage({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("任务详情")),
      body: Center(
        child: ListView(
          children: [
            TaskView(id: this.id),
          ],
        ),
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
  bool _editable = false;
  final _formKey = GlobalKey<FormState>();
  var _task = ApiTask();
  var _templates = <ApiTemplate>[];
  var _variables = <ApiVariable>[];
  var _allTemplates = <ApiTemplate>[];
  var _allVariables = <ApiVariable>[];
  var _jobs = <ApiJob>[];

  TaskViewState({this.id}) {
    var client = CICDServiceApi(ApiClient(basePath: Config.CICDEndpoint));
    client.cICDServiceGetTask(id).then((value) {
      _task = value;
      _nameController.text = _task.name;
      _descriptionController.text = _task.description;
      client.cICDServiceListTemplate(offset: "0", limit: "20").then(
            (value) => setState(() {
              _allTemplates = value.templates;
              _templates = _allTemplates.where((element) => _task.templateIDs.contains(element.id)).toList();
              _allTemplates.removeWhere((element) => _task.templateIDs.contains(element.id));
            }),
          );

      client.cICDServiceListVariable(offset: "0", limit: "20").then(
            (value) => setState(() {
              _allVariables = value.variables;
              _variables = _allVariables.where((element) => _task.variableIDs.contains(element.id)).toList();
              _allVariables.removeWhere((element) => _task.variableIDs.contains(element.id));
            }),
          );
      client.cICDServiceListJob(offset: "0", limit: "20", taskID: id).then((value) => setState(() {
            print(value);
            _jobs = value.jobs;
          }));
    });
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

    var task = createTaskByTextEditControllers();
    if (_task.toString() == task.toString()) {
      Trac(context, "无需更新");
      return;
    }

    var client = CICDServiceApi(ApiClient(basePath: Config.CICDEndpoint));
    client.cICDServiceUpdateTask(id, task).then((value) {
      Info(context, "更新成功");
      setState(() {
        _editable = false;
      });
      _task = task;
    }).catchError((e) {
      Warn(context, "更新失败: $e");
    });
  }

  void delete() async {
    var client = CICDServiceApi(ApiClient(basePath: Config.CICDEndpoint));
    client.cICDServiceDelTask(id).then((value) {
      Info(context, "删除成功");
      context.read<TaskModel>().del(id);
      Navigator.pop(context);
    }).catchError((e) {
      Warn(context, "删除失败: $e");
    });
  }

  void runTask() async {
    var client = CICDServiceApi(ApiClient(basePath: Config.CICDEndpoint));
    client.cICDServiceRunTask(ApiRunTaskReq()..taskID = id).then((value) {
      client.cICDServiceGetJob(value.jobID).then((value) => setState(() => _jobs.insert(0, value)));
    });
  }

  void cancel() {
    setTextEditControllersByTask(_task);
    setState(() {
      _editable = false;
    });
  }

  void setTextEditControllersByTask(ApiTask task) {
    _nameController.text = task.name;
    _descriptionController.text = task.description;
    _allTemplates.addAll(_templates);
    _templates = _allTemplates.where((element) => _task.templateIDs.contains(element.id)).toList();
    _allTemplates.removeWhere((element) => _task.templateIDs.contains(element.id));
    _allVariables.addAll(_variables);
    _variables = _allVariables.where((element) => _task.variableIDs.contains(element.id)).toList();
    _allVariables.removeWhere((element) => _task.variableIDs.contains(element.id));
  }

  ApiTask createTaskByTextEditControllers() {
    var task = ApiTask();
    task.id = widget.id;
    task.name = _nameController.value.text;
    task.description = _descriptionController.value.text;
    task.variableIDs.addAll(_variables.map((e) => e.id));
    task.templateIDs.addAll(_templates.map((e) => e.id));
    return task;
  }

  @override
  Widget build(BuildContext context) {
    var maxWidth = min(MediaQuery.of(context).size.width - 80, 800);
    return Center(
      child: Container(
        width: maxWidth + 80,
        child: Padding(
          padding: EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleIconButton(
                    tooltip: "运行",
                    onPressed: _editable ? null : runTask,
                    icon: Icons.play_circle_filled,
                  ),
                  CircleIconButton(
                    tooltip: "保存",
                    onPressed: _editable ? save : null,
                    icon: Icons.save,
                  ),
                  CircleIconButton(
                    tooltip: "编辑",
                    onPressed: _editable ? null : edit,
                    icon: Icons.edit,
                  ),
                  CircleIconButton(
                    tooltip: "取消",
                    onPressed: _editable ? cancel : null,
                    icon: Icons.cancel,
                  ),
                  CircleIconButton(
                    tooltip: "删除",
                    onPressed: _editable ? null : delete,
                    icon: Icons.delete,
                    color: Colors.red,
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    MyTextField(
                        label: "名字",
                        controller: _nameController,
                        editable: _editable,
                        validator: StringValidator.required),
                    const SizedBox(height: 20),
                    MyTextField(label: "描述", controller: _descriptionController, editable: _editable),
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
                                onDeleted: _editable
                                    ? () {
                                        setState(() {
                                          _allVariables.addAll(_variables.where((element) => element.name == e.name));
                                          _variables.removeWhere((element) => element.name == e.name);
                                          print("[${e.name}] hello");
                                          print(_variables);
                                        });
                                      }
                                    : null,
                              ),
                            ),
                          ),
                          PopupMenuButton<ApiVariable>(
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
                            onSelected: (ApiVariable value) {
                              setState(() {
                                _variables.add(value);
                                _allVariables.removeWhere((element) => element.name == value.name);
                              });
                            },
                            itemBuilder: (BuildContext context) =>
                                _allVariables.map<PopupMenuEntry<ApiVariable>>((ApiVariable value) {
                              return PopupMenuItem<ApiVariable>(
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
                                onDeleted: _editable
                                    ? () {
                                        setState(() {
                                          _allTemplates.addAll(_templates.where((element) => element.name == e.name));
                                          _templates.removeWhere((element) => element.name == e.name);
                                          print("[${e.name}] hello");
                                          print(_templates);
                                        });
                                      }
                                    : null,
                              ),
                            ),
                          ),
                          PopupMenuButton<ApiTemplate>(
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
                            onSelected: (ApiTemplate value) {
                              setState(() {
                                _templates.add(value);
                                _allTemplates.removeWhere((element) => element.name == value.name);
                              });
                            },
                            itemBuilder: (BuildContext context) =>
                                _allTemplates.map<PopupMenuEntry<ApiTemplate>>((ApiTemplate value) {
                              return PopupMenuItem<ApiTemplate>(
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
              const SizedBox(height: 40),
              DataTable(
                  showCheckboxColumn: false,
                  columns: <String>[
                    maxWidth > 700 ? "ID" : null,
                    maxWidth > 400 ? "CreateAt" : null,
                    "Status",
                    "Operation"
                  ]
                      .where((element) => element != null)
                      .map((e) => DataColumn(label: Center(child: Text(e, textAlign: TextAlign.center))))
                      .toList(),
                  rows: _jobs
                      .map((e) => DataRow(
                          cells: <DataCell>[
                            maxWidth > 700 ? DataCell(Text(e.id)) : null,
                            maxWidth > 400
                                ? DataCell(Text(e.createAt == null
                                    ? "unknown"
                                    : DateTime.fromMillisecondsSinceEpoch(e.createAt * 1000).toIso8601String()))
                                : null,
                            DataCell(Icon(Icons.lens,
                                color: e.status == "Failed"
                                    ? Colors.red
                                    : (e.status == "Finish" ? Colors.green : Colors.yellow))),
                            DataCell(Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.refresh),
                                  onPressed: () {
                                    var client = CICDServiceApi(ApiClient(basePath: Config.CICDEndpoint));
                                    client.cICDServiceGetJob(e.id).then((value) => setState(() {
                                          var idx = _jobs.indexWhere((element) => element.id == e.id);
                                          _jobs.replaceRange(idx, idx + 1, [value]);
                                        }));
                                  },
                                ),
                                IconButton(
                                    icon: Icon(Icons.delete),
                                    color: Colors.red,
                                    onPressed: e.status != "Finish" && e.status != "Failed"
                                        ? null
                                        : () {
                                            var client = CICDServiceApi(ApiClient(basePath: Config.CICDEndpoint));
                                            client.cICDServiceDelJob(e.id).then((value) => setState(() {
                                                  print(_jobs.length);
                                                  _jobs.removeWhere((element) => element.id == e.id);
                                                  print(_jobs.length);
                                                }));
                                          }),
                              ],
                            )),
                          ].where((element) => element != null).toList(),
                          onSelectChanged: (bool selected) {
                            if (selected) {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => JobViewPage(id: e.id)));
                            }
                          }))
                      .toList()),
            ],
          ),
        ),
      ),
    );
  }
}
