import 'dart:math';

import 'package:cicd/api/api.dart';
import 'package:cicd/config/config.dart';
import 'package:cicd/pages/variable/variable.dart';
import 'package:cicd/validator/validator.dart';
import 'package:cicd/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VariableViewPage extends StatelessWidget {
  final String id;
  VariableViewPage({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("变量详情")),
      body: Center(
        child: ListView(children: [VariableView(id: this.id)]),
      ),
    );
  }
}

class VariableView extends StatefulWidget {
  final String id;
  VariableView({Key key, this.id}) : super(key: key);

  @override
  State<VariableView> createState() => VariableViewState(id: id);
}

class VariableViewState extends State<VariableView> {
  final String id;
  var _nameController = TextEditingController();
  var _descriptionController = TextEditingController();
  var _kvsController = TextEditingController();
  bool _editable = false;
  var _variable = ApiVariable();
  final _formKey = GlobalKey<FormState>();

  VariableViewState({this.id}) {
    var client = CICDServiceApi(ApiClient(basePath: Config.CICDEndpoint));
    client.cICDServiceGetVariable(id).then((value) => setState(() {
          _variable = value;
          setTextEditControllersByVariable(_variable);
        }));
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

    var variable = createVariableByTextEditControllers();
    if (_variable.toString() == variable.toString()) {
      Trac(context, "无需更新");
      return;
    }

    var client = CICDServiceApi(ApiClient(basePath: Config.CICDEndpoint));
    client.cICDServiceUpdateVariable(id, variable).then((value) {
      Info(context, "更新成功");
      setState(() {
        _editable = false;
      });
      _variable = variable;
    }).catchError((e) => Warn(context, "更新失败: $e"));
  }

  void delete() async {
    var client = CICDServiceApi(ApiClient(basePath: Config.CICDEndpoint));
    client.cICDServiceDelVariable(id).then((value) {
      Info(context, "删除成功");
      context.read<VariableModel>().del(id);
      Navigator.pop(context);
    }).catchError((e) => Warn(context, "删除失败: $e"));
  }

  void cancel() {
    setTextEditControllersByVariable(_variable);
    setState(() {
      _editable = false;
    });
  }

  void setTextEditControllersByVariable(ApiVariable variable) {
    _nameController.text = variable.name;
    _descriptionController.text = variable.description;
    _kvsController.text = variable.kvs;
  }

  ApiVariable createVariableByTextEditControllers() {
    var variable = ApiVariable();
    variable.id = widget.id;
    variable.name = _nameController.value.text;
    variable.description = _descriptionController.value.text;
    variable.kvs = _kvsController.value.text;
    return variable;
  }

  @override
  Widget build(BuildContext context) {
    var maxWidth = min(MediaQuery.of(context).size.width, 800);
    return Center(
      child: Container(
        width: maxWidth,
        child: Padding(
          padding: EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleIconButton(
                    tooltip: "保存",
                    onPressed: _editable ? save : null,
                    icon: Icons.save,
                  ),
                  const SizedBox(width: 10),
                  CircleIconButton(
                    tooltip: "编辑",
                    onPressed: _editable ? null : edit,
                    icon: Icons.edit,
                  ),
                  const SizedBox(width: 10),
                  CircleIconButton(
                    tooltip: "取消",
                    onPressed: _editable ? cancel : null,
                    icon: Icons.cancel,
                  ),
                  const SizedBox(width: 10),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: maxWidth / 2.5,
                          child: MyTextField(
                            label: "名字",
                            controller: _nameController,
                            editable: _editable,
                            validator: StringValidator.required,
                          ),
                        ),
                        SizedBox(
                          width: maxWidth / 2.5,
                          child: MyTextField(label: "描述", controller: _descriptionController, editable: _editable),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    MyTextField(
                      label: "键值",
                      validator: StringValidator.isJson,
                      controller: _kvsController,
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
      ),
    );
  }
}
