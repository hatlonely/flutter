import 'dart:math';

import 'package:cicd/api/api.dart';
import 'package:cicd/config/config.dart';
import 'package:cicd/pages/template/template.dart';
import 'package:cicd/validator/validator.dart';
import 'package:cicd/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PutTemplateViewPage extends StatelessWidget {
  final String id;
  PutTemplateViewPage({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("新增模板")),
      body: Center(
        child: ListView(children: [PutTemplateView()]),
      ),
    );
  }
}

class PutTemplateView extends StatefulWidget {
  @override
  State<PutTemplateView> createState() => PutTemplateViewState();
}

class PutTemplateViewState extends State<PutTemplateView> {
  var _nameController = TextEditingController();
  var _categoryController = TextEditingController();
  var _descriptionController = TextEditingController();
  var _scriptController = TextEditingController();
  String _language;
  bool _editable = true;
  final _formKey = GlobalKey<FormState>();

  void save() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    var client = CICDServiceApi(ApiClient(basePath: Config.CICDEndpoint));
    var template = createTemplateByTextEditControllers();
    client.cICDServicePutTemplate(template).then((value) {
      Info(context, "插入成功");
      context.read<TemplateModel>().update();
    }).catchError((e) => Warn(context, "插入失败: $e"));
  }

  void cancel() {
    Navigator.pop(context);
  }

  void setTextEditControllersByTemplate(ApiTemplate template) {
    _nameController.text = template.name;
    _categoryController.text = template.category;
    _descriptionController.text = template.description;
    _language = template.scriptTemplate.language;
    _scriptController.text = template.scriptTemplate.script;
  }

  ApiTemplate createTemplateByTextEditControllers() {
    var template = ApiTemplate();
    template.name = _nameController.value.text;
    template.description = _descriptionController.value.text;
    template.category = _categoryController.value.text;
    template.type = "script";
    template.scriptTemplate = TemplateScriptTemplate();
    template.scriptTemplate.language = _language;
    template.scriptTemplate.script = _scriptController.value.text;
    return template;
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
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: maxWidth / 3.25,
                          child: MyTextField(
                            label: "名字",
                            controller: _nameController,
                            editable: _editable,
                            validator: StringValidator.required,
                          ),
                        ),
                        SizedBox(
                          width: maxWidth / 3.25,
                          child: MyDropDownTextFormField(
                            label: "语言",
                            items: ["shell", "python3"],
                            value: _language,
                            enable: _editable,
                            onChanged: (value) {
                              setState(() {
                                _language = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: maxWidth / 3.25,
                          child: MyTextField(label: "类别", controller: _categoryController, editable: _editable),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    MyTextField(label: "描述", controller: _descriptionController, editable: _editable),
                    const SizedBox(height: 20),
                    MyTextField(
                      label: "脚本",
                      controller: _scriptController,
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
