import 'dart:math';

import 'package:cicd/api/api.dart';
import 'package:cicd/config/config.dart';
import 'package:cicd/pages/template/template.dart';
import 'package:cicd/validator/validator.dart';
import 'package:cicd/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TemplateViewPage extends StatelessWidget {
  final String id;
  TemplateViewPage({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("模板详情")),
      body: Center(
        child: ListView(children: [TemplateView(id: this.id)]),
      ),
    );
  }
}

class TemplateView extends StatefulWidget {
  final String id;
  TemplateView({Key key, this.id}) : super(key: key);

  @override
  State<TemplateView> createState() => TemplateViewState(id: id);
}

class TemplateViewState extends State<TemplateView> {
  final String id;
  var _nameController = TextEditingController();
  var _categoryController = TextEditingController();
  var _descriptionController = TextEditingController();
  var _scriptController = TextEditingController();
  String _language;
  bool _editable = false;
  var _template = ApiTemplate();
  final _formKey = GlobalKey<FormState>();

  TemplateViewState({this.id}) {
    var client = CICDServiceApi(ApiClient(basePath: Config.CICDEndpoint));
    client.cICDServiceGetTemplate(id).then((value) => setState(() {
          _template = value;
          setTextEditControllersByTemplate(_template);
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

    var template = createTemplateByTextEditControllers();
    if (_template.toString() == template.toString()) {
      Trac(context, "无需更新");
      return;
    }

    var client = CICDServiceApi(ApiClient(basePath: Config.CICDEndpoint));
    client.cICDServiceUpdateTemplate(id, template).then((value) {
      Info(context, "更新成功");
      setState(() {
        _editable = false;
      });
      _template = template;
    }).catchError((e) => Warn(context, "更新失败: $e"));
  }

  void delete() async {
    var client = CICDServiceApi(ApiClient(basePath: Config.CICDEndpoint));
    client.cICDServiceDelTemplate(id).then((value) {
      Info(context, "删除成功");
      context.read<TemplateModel>().del(id);
      Navigator.pop(context);
    }).catchError((e) => Warn(context, "删除失败: $e"));
  }

  void cancel() {
    setTextEditControllersByTemplate(_template);
    setState(() {
      _editable = false;
    });
  }

  void setTextEditControllersByTemplate(ApiTemplate template) {
    _nameController.text = template.name;
    _nameController.text = template.name;
    _categoryController.text = template.category;
    _descriptionController.text = template.description;
    _language = template.scriptTemplate?.language;
    _scriptController.text = template.scriptTemplate?.script;
  }

  ApiTemplate createTemplateByTextEditControllers() {
    var template = ApiTemplate();
    template.id = widget.id;
    template.name = _nameController.value.text;
    template.description = _descriptionController.value.text;
    template.category = _categoryController.value.text;
    template.type = "script";
    template.scriptTemplate = TemplateScriptTemplate();
    template.scriptTemplate.language = _language;
    template.scriptTemplate.script = _scriptController.value.text;
    template.createAt = _template.createAt;
    template.updateAt = _template.updateAt;
    return template;
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: maxWidth / 4,
                          child: MyTextField(
                            label: "名字",
                            controller: _nameController,
                            editable: _editable,
                            validator: StringValidator.required,
                          ),
                        ),
                        SizedBox(
                          width: maxWidth / 4,
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
                          width: maxWidth / 4,
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
                      maxLines: 100,
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
