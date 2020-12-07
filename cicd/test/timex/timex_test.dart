import 'package:cicd/timex/timex.dart';
import 'package:test/test.dart';

void main() {
  test("StringValidator.required", () {
    print(DateTime.fromMillisecondsSinceEpoch(1607362816000).toHumanString());

    [].map((e) => "").where((element) => element != null).toList();
    List<String> ls;
    []?.map((e) => "").where((element) => element != null).toList();
  });
}
