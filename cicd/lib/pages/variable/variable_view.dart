import 'package:cicd/api/api.dart';
import 'package:cicd/config/config.dart';
import 'package:cicd/validator/validator.dart';
import 'package:cicd/widget/widget.dart';
import 'package:flutter/material.dart';

class VariableViewPage extends StatelessWidget {
  final String id;
  VariableViewPage({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("variable")),
      body: Center(
        child: VariableView(id: this.id),
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
    client.cICDServiceGetVariable(id).then((value) => setState(() => _variable = value));
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
    if (_variable == variable) {
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
                  MyTextField(key: "描述", controller: _descriptionController, editable: _editable),
                  const SizedBox(height: 20),
                  MyTextField(
                    key: "键值",
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
