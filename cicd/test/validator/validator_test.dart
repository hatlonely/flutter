import 'package:cicd/validator/validator.dart';
import 'package:test/test.dart';

void main() {
  test("StringValidator.required", () {
    expect(StringValidator.group([StringValidator.required, StringValidator.isJson])('{"key1": "val1", "key2": 2}'),
        isNull);

    expect(StringValidator.required(""), isNotNull);
    expect(StringValidator.required(" "), isNotNull);
    expect(StringValidator.required(null), isNotNull);
    expect(StringValidator.required("hello world"), isNull);

    expect(StringValidator.isJson("hello world"), isNotNull);
    expect(StringValidator.isJson(""), isNotNull);
    expect(StringValidator.isJson(null), isNotNull);
    expect(StringValidator.isJson('{"key1": "val1", "key2": 2}'), isNull);
    expect(StringValidator.isJson('123'), isNull);
  });
}
