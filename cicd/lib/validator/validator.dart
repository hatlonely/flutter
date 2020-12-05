import 'dart:convert';

class StringValidator {
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
      json.decode(value) as Map<String, dynamic>;
      return null;
    } on Exception {
      return "非法的 json";
    }
  }
}
