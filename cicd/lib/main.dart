import 'package:cicd/pages/template/template.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TemplateModel()),
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
      home: TemplatePage(),
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
