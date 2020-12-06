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
      appBar: AppBar(title: Text("put template")),
      body: Center(
        child: PutTemplateView(),
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
  var _languageController = TextEditingController();
  var _scriptController = TextEditingController();
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
    _languageController.text = template.scriptTemplate.language;
    _scriptController.text = template.scriptTemplate.script;
  }

  ApiTemplate createTemplateByTextEditControllers() {
    var template = ApiTemplate();
    template.name = _nameController.value.text;
    template.description = _descriptionController.value.text;
    template.category = _categoryController.value.text;
    template.type = "script";
    template.scriptTemplate = TemplateScriptTemplate();
    template.scriptTemplate.language = _languageController.value.text;
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
                  tooltip: "取消",
                  color: Colors.white,
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
                  MyTextField(
                      label: "名字",
                      controller: _nameController,
                      editable: _editable,
                      validator: StringValidator.required),
                  const SizedBox(height: 20),
                  MyTextField(label: "类别", controller: _categoryController, editable: _editable),
                  const SizedBox(height: 20),
                  MyTextField(label: "描述", controller: _descriptionController, editable: _editable),
                  const SizedBox(height: 20),
                  MyTextField(label: "语言", controller: _languageController, editable: _editable),
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
    );
  }
}
