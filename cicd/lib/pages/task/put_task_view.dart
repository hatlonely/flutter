import 'dart:math';

import 'package:cicd/api/api.dart';
import 'package:cicd/config/config.dart';
import 'package:cicd/pages/task/task.dart';
import 'package:cicd/validator/validator.dart';
import 'package:cicd/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PutTaskViewPage extends StatelessWidget {
  final String id;
  PutTaskViewPage({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("新增任务")),
      body: Center(
        child: ListView(children: [PutTaskView()]),
      ),
    );
  }
}

class PutTaskView extends StatefulWidget {
  @override
  State<PutTaskView> createState() => PutTaskViewState();
}

class PutTaskViewState extends State<PutTaskView> with SingleTickerProviderStateMixin {
  var _nameController = TextEditingController();
  var _descriptionController = TextEditingController();
  bool _editable = true;
  final _formKey = GlobalKey<FormState>();

  var _templates = <ApiTemplate>[];
  var _variables = <ApiVariable>[];
  var _allTemplates = <ApiTemplate>[];
  var _allVariables = <ApiVariable>[];

  PutTaskViewState() {
    var client = CICDServiceApi(ApiClient(basePath: Config.CICDEndpoint));

    client.cICDServiceListTemplate(offset: "0", limit: "20").then(
          (value) => setState(() {
            _allTemplates = value.templates;
          }),
        );

    client.cICDServiceListVariable(offset: "0", limit: "20").then(
          (value) => setState(() {
            _allVariables = value.variables;
          }),
        );
  }

  void save() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    var client = CICDServiceApi(ApiClient(basePath: Config.CICDEndpoint));
    var task = createTaskByTextEditControllers();
    client.cICDServicePutTask(task).then((value) {
      Info(context, "插入成功");
      context.read<TaskModel>().update();
    }).catchError((e) => Warn(context, "插入失败: $e"));
  }

  void cancel() {
    Navigator.pop(context);
  }

  ApiTask createTaskByTextEditControllers() {
    var task = ApiTask();
    task.name = _nameController.value.text;
    task.description = _descriptionController.value.text;
    task.variableIDs.addAll(_variables.map((e) => e.id).toList());
    task.templateIDs.addAll(_templates.map((e) => e.id).toList());
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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleIconButton(
                    color: Colors.deepPurple,
                    tooltip: "保存",
                    onPressed: _editable ? save : null,
                    icon: Icons.save,
                  ),
                  CircleIconButton(
                    color: Colors.deepPurple,
                    tooltip: "取消",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: maxWidth / 2.25,
                          child: MyTextField(
                            label: "名字",
                            controller: _nameController,
                            editable: _editable,
                            validator: StringValidator.required,
                          ),
                        ),
                        SizedBox(
                          width: maxWidth / 2.25,
                          child: MyTextField(label: "描述", controller: _descriptionController, editable: _editable),
                        ),
                      ],
                    ),
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
                                  });
                                },
                              ),
                            ),
                          ),
                          PopupMenuButton<ApiVariable>(
                            tooltip: "添加变量",
                            padding: EdgeInsets.zero,
                            offset: Offset.zero,
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
                                onDeleted: () {
                                  setState(() {
                                    _allTemplates.addAll(_templates.where((element) => element.name == e.name));
                                    _templates.removeWhere((element) => element.name == e.name);
                                  });
                                },
                              ),
                            ),
                          ),
                          PopupMenuButton<ApiTemplate>(
                            tooltip: "添加模板",
                            padding: EdgeInsets.zero,
                            offset: Offset.zero,
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
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
