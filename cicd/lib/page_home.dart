import 'package:flutter/material.dart';

import 'page_template.dart';
import 'page_variable.dart';
import 'page_task.dart';

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
