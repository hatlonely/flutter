import 'package:cicd/api/api.dart';
import 'package:cicd/config/config.dart';
import 'package:cicd/pages/variable/put_variable_view.dart';
import 'package:cicd/pages/variable/variable_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VariablePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => VariablePageState();
}

class VariablePageState extends State<VariablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("变量")),
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

class VariableModel extends ChangeNotifier {
  var _variables = <ApiVariable>[];
  List<ApiVariable> get variables => _variables;

  VariableModel() {
    update();
  }

  void update() {
    var client = CICDServiceApi(ApiClient(basePath: Config.CICDEndpoint));
    client.cICDServiceListVariable(offset: "0", limit: "20").then((res) {
      _variables = res.variables;
      notifyListeners();
    });
  }

  void del(String id) {
    _variables.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}

class VariableViewState extends State<VariableView> {
  @override
  Widget build(BuildContext context) {
    var cards = context.watch<VariableModel>().variables.map((e) {
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
