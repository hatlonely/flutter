import 'package:cicd/api/api.dart';
import 'package:cicd/config/config.dart';
import 'package:cicd/validator/validator.dart';
import 'package:cicd/widget/widget.dart';
import 'package:flutter/material.dart';

class PutVariableViewPage extends StatelessWidget {
  final String id;
  PutVariableViewPage({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("put variable")),
      body: Center(
        child: PutVariableView(),
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
    client
        .cICDServicePutVariable(variable)
        .then((value) => Info(context, "插入成功"))
        .catchError((e) => Warn(context, "插入失败: $e"));
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
                      key: "名字", controller: _nameController, editable: _editable, validator: StringValidator.required),
                  const SizedBox(height: 20),
                  MyTextField(key: "描述", controller: _descriptionController, editable: _editable),
                  const SizedBox(height: 20),
                  MyTextField(
                    key: "键值",
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
    );
  }
}
