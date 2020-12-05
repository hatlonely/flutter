import 'dart:convert';

class StringValidator {
  static String Function(String) group(List<String Function(String)> validators) {
    return (String value) {
      for (var validator in validators) {
        var v = validator(value);
        if (v != null) {
          return v;
        }
      }
      return null;
    };
  }

  static String required(String value) {
    if ((value?.isEmpty ?? true) || value.trim().isEmpty) {
      return "不能为空";
    }
    return null;
  }

  static String isJson(String value) {
    if (value == null) {
      return "非法的 json";
    }
    try {
      json.decode(value);
      return null;
    } on Exception {
      return "非法的 json";
    } on Error {
      return "非法的 json";
    }
  }
}
