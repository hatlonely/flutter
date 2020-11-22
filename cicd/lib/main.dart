import 'package:flutter/material.dart';
import 'dart:math';
import 'page_home.dart';
import 'package:cicd/pages/template/template.dart';

void main() {
  runApp(CICDApp());
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
