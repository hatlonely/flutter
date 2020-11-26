import 'package:cicd/api2/api.dart';
import 'package:cicd/config/config.dart';
import 'package:cicd/pages/variable/put_variable_view.dart';
import 'package:cicd/pages/variable/variable_view.dart';
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
        child: VariableView(),
      ),
    );
  }
}

class VariableView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => VariableViewState();
}

class VariableViewState extends State<VariableView> {
  var _variables = <ApiVariable>[];

  VariableViewState() {
    var client = CICDServiceApi(ApiClient(basePath: Config.CICDEndpoint));
    client.cICDServiceListVariable(offset: "0", limit: "20").then((res) {
      setState(() {
        _variables = res.variables;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var cards = _variables.map((e) {
      return GestureDetector(
        onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => VariableViewPage(id: e.id)))},
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(e.name),
              Text(e.description),
            ],
          ),
        ),
      );
    }).toList();

    cards.add(GestureDetector(
        onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => PutVariableViewPage()))},
        child: Card(
            margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            elevation: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add, size: 60),
              ],
            ))));

    return GridView.count(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      crossAxisCount: MediaQuery.of(context).size.width ~/ 300.0,
      childAspectRatio: 1.618,
      children: cards,
    );
  }
}
