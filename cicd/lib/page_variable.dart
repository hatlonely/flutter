import 'package:flutter/material.dart';

class VariablePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => VariablePageState();
}

class VariablePageState extends State<VariablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("variable")),
      body: Center(
        child: Text("variable page"),
      ),
    );
  }
}
