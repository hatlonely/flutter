import 'package:cicd/page_home.dart';
import 'package:cicd/pages/task/task.dart';
import 'package:cicd/pages/template/template.dart';
import 'package:cicd/pages/variable/variable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TemplateModel()),
        ChangeNotifierProvider(create: (context) => VariableModel()),
        ChangeNotifierProvider(create: (context) => TaskModel()),
      ],
      child: CICDApp(),
    ),
  );
}

class CICDApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CICD Service",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class CodeEditor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CodeEditorState();
}

class CodeEditorState extends State<CodeEditor> {
  @override
  Widget build(BuildContext context) {
    return Text("hello world");
  }
}
