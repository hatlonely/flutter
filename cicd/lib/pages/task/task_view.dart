import 'package:flutter/material.dart';
import 'package:cicd/api/cicd.pb.dart' as api;
import 'package:http/http.dart' as http;
import 'package:cicd/widget/widget.dart';
import 'dart:convert';

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
  State<TaskView> createState() => TaskViewState();
}

class TaskViewState extends State<TaskView> {
  var _nameController = TextEditingController();
  var _categoryController = TextEditingController();
  var _descriptionController = TextEditingController();
  var _languageController = TextEditingController();
  var _scriptController = TextEditingController();
  bool _editable = false;
  var _task = api.Task();
  final _formKey = GlobalKey<FormState>();

  String validate(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return "不能为空";
    }
    return null;
  }

  Future<api.Task> getTask() async {
    var httpClient = http.Client();
    var res = await httpClient.get("http://127.0.0.1/v1/task/${widget.id}");
    var task = api.Task();
    task.mergeFromProto3Json(json.decode(res.body));
    return task;
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

    var res = await cli.put("http://127.0.0.1/v1/task/${widget.id}", body: json.encode(task.toProto3Json()));
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
    var res = await cli.delete("http://127.0.0.1/v1/task/${widget.id}");
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
  }

  api.Task createTaskByTextEditControllers() {
    var task = api.Task();
    task.id = widget.id;
    task.name = _nameController.value.text;
    task.description = _descriptionController.value.text;
    return task;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: api.Task(),
      future: getTask(),
      builder: (context, value) {
        var res = value.data as api.Task;
        _task = res;

        setTextEditControllersByTask(res);

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
