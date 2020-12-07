import 'dart:math';

import 'package:cicd/api/api.dart';
import 'package:cicd/config/config.dart';
import 'package:cicd/pages/variable/variable.dart';
import 'package:cicd/validator/validator.dart';
import 'package:cicd/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PutVariableViewPage extends StatelessWidget {
  final String id;
  PutVariableViewPage({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("新增变量")),
      body: Center(
        child: ListView(children: [PutVariableView()]),
      ),
    );
  }
}

class PutVariableView extends StatefulWidget {
  @override
  State<PutVariableView> createState() => PutVariableViewState();
}

class PutVariableViewState extends State<PutVariableView> {
  var _nameController = TextEditingController();
  var _descriptionController = TextEditingController();
  var _kvsController = TextEditingController();
  bool _editable = true;
  final _formKey = GlobalKey<FormState>();

  void save() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    var client = CICDServiceApi(ApiClient(basePath: Config.CICDEndpoint));
    var variable = createVariableByTextEditControllers();
    client.cICDServicePutVariable(variable).then((value) {
      Info(context, "插入成功");
      context.read<VariableModel>().update();
    }).catchError((e) => Warn(context, "插入失败: $e"));
  }

  void cancel() {
    Navigator.pop(context);
  }

  void setTextEditControllersByVariable(ApiVariable variable) {
    _nameController.text = variable.name;
    _descriptionController.text = variable.description;
    _kvsController.text = variable.kvs;
  }

  ApiVariable createVariableByTextEditControllers() {
    var variable = ApiVariable();
    variable.name = _nameController.value.text;
    variable.description = _descriptionController.value.text;
    variable.kvs = _kvsController.value.text;
    return variable;
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
                    tooltip: "保存",
                    onPressed: _editable ? save : null,
                    icon: Icons.save,
                  ),
                  CircleIconButton(
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
