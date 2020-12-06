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
      appBar: AppBar(title: Text("template")),
      body: Center(
        child: TemplateView(id: this.id),
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
    return template;
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
                  MyTextField(
                      key: "名字", controller: _nameController, editable: _editable, validator: StringValidator.required),
                  const SizedBox(height: 20),
                  MyTextField(key: "类别", controller: _categoryController, editable: _editable),
                  const SizedBox(height: 20),
                  MyTextField(key: "描述", controller: _descriptionController, editable: _editable),
                  const SizedBox(height: 20),
                  MyDropDownTextFormField(
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
                  const SizedBox(height: 20),
                  MyTextField(
                    key: "脚本",
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
    );
  }
}
