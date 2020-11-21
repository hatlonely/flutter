import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(CICDApp());
}

class CICDApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CICD Service",
      theme: ThemeData(primarySwatch: Colors.red),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CICD Service")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueGrey),
              child: Center(child: Text("CICD", style: Theme.of(context).textTheme.headline5)),
            ),
            ListTile(
              leading: Icon(Icons.view_list),
              title: Text("task"),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TaskPage())),
            ),
            ListTile(
              leading: Icon(Icons.subject),
              title: Text("template"),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TemplatePage())),
            ),
            ListTile(
              leading: Icon(Icons.settings_ethernet),
              title: Text("variable"),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => VariablePage())),
            ),
          ],
        ),
      ),
      body: Center(child: Text("home")),
    );
  }
}

class TemplatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TemplatePageState();
}

class TemplatePageState extends State<TemplatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("tempate")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("name"),
            TextField(
              decoration: InputDecoration(
                hintText: "Hint text sample",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    color: Colors.amber,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              controller: TextEditingController(),
            ),
            Text("description"),
            TextField(
              controller: TextEditingController(),
            ),
            Text("language"),
            TextField(
              controller: TextEditingController(),
            ),
            Text("script"),
            TextField(
              controller: TextEditingController(),
            )
          ],
        ),
      ),
    );
  }
}

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

class TaskPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TaskPageState();
}

class TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("task")),
      body: Center(
        child: Text("task page"),
      ),
    );
  }
}
