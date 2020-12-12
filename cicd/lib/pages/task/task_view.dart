import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:cicd/api/api.dart';
import 'package:cicd/config/config.dart';
import 'package:cicd/pages/task/job_view.dart';
import 'package:cicd/pages/task/task.dart';
import 'package:cicd/pages/template/template_view.dart';
import 'package:cicd/pages/variable/variable_view.dart';
import 'package:cicd/timex/timex.dart';
import 'package:cicd/validator/validator.dart';
import 'package:cicd/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:mustache_template/mustache_template.dart';
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

class TwinkIcon extends StatefulWidget {
  @override
  TwinkIconState createState() => TwinkIconState();
}

class TwinkIconState extends State<TwinkIcon> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> _animation;
  Timer _timer;
  bool _flag = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    _animation = ColorTween(begin: Colors.yellow, end: Colors.white).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _timer = Timer.periodic(Duration(milliseconds: 600), (timer) => _changeColor());
  }

  void _changeColor() {
    _flag ? _controller.forward() : _controller.reverse();
    _flag = !_flag;
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.lens, color: _animation.value);
  }
}

class TaskView extends StatefulWidget {
  final String id;
  TaskView({Key key, this.id}) : super(key: key);

  @override
  State<TaskView> createState() => TaskViewState(id: id);
}

class TaskViewState extends State<TaskView> with SingleTickerProviderStateMixin {
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
            _jobs = value.jobs ?? [];
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
    var variableMap = Map.fromIterable(_variables, key: (e) => e.name, value: (e) => jsonDecode(e.kvs));

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
                  !_editable
                      ? CircleIconButton(
                          color: Colors.deepPurple,
                          tooltip: "编辑",
                          onPressed: edit,
                          icon: Icons.edit,
                        )
                      : null,
                  !_editable
                      ? CircleIconButton(
                          color: Colors.green,
                          tooltip: "运行",
                          onPressed: runTask,
                          icon: Icons.play_circle_filled,
                        )
                      : null,
                  !_editable
                      ? CircleIconButton(
                          tooltip: "删除",
                          onPressed: delete,
                          icon: Icons.delete,
                          color: Colors.red,
                        )
                      : null,
                  _editable
                      ? CircleIconButton(
                          color: Colors.deepPurple,
                          tooltip: "保存",
                          onPressed: save,
                          icon: Icons.save,
                        )
                      : null,
                  _editable
                      ? CircleIconButton(
                          color: Colors.deepPurple,
                          tooltip: "取消",
                          onPressed: cancel,
                          icon: Icons.cancel,
                        )
                      : null,
                ].where((element) => element != null).toList(),
              ),
              const SizedBox(height: 40),
              Form(
                key: _formKey,
                child: Column(
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
                          ..._variables.map(
                            (e) => RawChip(
                              backgroundColor: Colors.pink,
                              label: Text(e.name, style: TextStyle(color: Colors.white)),
                              deleteIcon: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.all(2),
                                child: Icon(Icons.clear, color: Colors.pink, size: 14),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => VariableViewPage(id: e.id)));
                              },
                              onDeleted: _editable
                                  ? () {
                                      setState(() {
                                        _allVariables.addAll(_variables.where((element) => element.name == e.name));
                                        _variables.removeWhere((element) => element.name == e.name);
                                      });
                                    }
                                  : null,
                            ),
                          ),
                          _editable
                              ? PopupMenuButton<ApiVariable>(
                                  tooltip: "添加变量",
                                  padding: EdgeInsets.zero,
                                  offset: Offset.zero,
                                  enabled: _editable,
                                  child: Container(
                                    height: 28,
                                    width: 28,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.pink,
                                    ),
                                    padding: EdgeInsets.all(2),
                                    child: Icon(Icons.add, size: 20, color: Colors.white),
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
                                )
                              : null,
                        ].where((element) => element != null).toList(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CodeView(
                      code: JsonEncoder.withIndent("  ").convert(variableMap),
                      language: "json",
                      width: maxWidth,
                      borderColor: Colors.pink,
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Wrap(
                        spacing: 20,
                        children: [
                          ..._templates.map(
                            (e) => RawChip(
                              backgroundColor: Colors.teal,
                              label: Text(e.name, style: TextStyle(color: Colors.white)),
                              deleteIcon: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.all(2),
                                child: Icon(Icons.clear, color: Colors.teal, size: 14),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => TemplateViewPage(id: e.id)));
                              },
                              onDeleted: _editable
                                  ? () {
                                      setState(() {
                                        _allTemplates.addAll(_templates.where((element) => element.name == e.name));
                                        _templates.removeWhere((element) => element.name == e.name);
                                      });
                                    }
                                  : null,
                            ),
                          ),
                          _editable
                              ? PopupMenuButton<ApiTemplate>(
                                  tooltip: "添加模板",
                                  padding: EdgeInsets.zero,
                                  offset: Offset.zero,
                                  enabled: _editable,
                                  child: Container(
                                    height: 28,
                                    width: 28,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.teal,
                                    ),
                                    padding: EdgeInsets.all(2),
                                    child: Icon(Icons.add, size: 20, color: Colors.white),
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
                                )
                              : null,
                        ].where((element) => element != null).toList(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ..._templates.map((e) {
                      try {
                        return CodeView(
                          code: Template(e.scriptTemplate.script).renderString(variableMap),
                          language: e.scriptTemplate.language,
                          width: maxWidth,
                          borderColor: Colors.teal,
                        );
                      } catch (err) {
                        return CodeView(
                          code: e.scriptTemplate.script,
                          language: e.scriptTemplate.language,
                          width: maxWidth,
                          borderColor: Colors.red,
                        );
                      }
                    }),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              DataTable(
                  showCheckboxColumn: false,
                  columns: <String>[maxWidth > 700 ? "序号" : null, maxWidth > 370 ? "创建时间" : null, "状态", "操作"]
                      .where((element) => element != null)
                      .map((e) => DataColumn(label: Text(e)))
                      .toList(),
                  rows: (_jobs ?? [])
                      .map((e) => DataRow(
                          cells: <DataCell>[
                            maxWidth > 700 ? DataCell(Text(e.seq.toString())) : null,
                            maxWidth > 370
                                ? DataCell(Text(e.createAt == null
                                    ? "unknown"
                                    : DateTime.fromMillisecondsSinceEpoch(e.createAt * 1000).toHumanString()))
                                : null,
                            DataCell(e.status == "Failed"
                                ? Icon(Icons.lens, color: Colors.red)
                                : e.status == "Finish"
                                    ? Icon(Icons.lens, color: Colors.green)
                                    : TwinkIcon()),
                            DataCell(Row(
                              children: [
                                IconButton(
                                  splashRadius: 20,
                                  tooltip: "刷新",
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
                                    splashRadius: 20,
                                    tooltip: "删除",
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
