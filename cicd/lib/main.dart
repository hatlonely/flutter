import 'package:cicd/page_home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CICDApp());
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
