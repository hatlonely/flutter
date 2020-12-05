//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ApiListTaskRes {
  /// Returns a new [ApiListTaskRes] instance.
  ApiListTaskRes({
    this.tasks = const [],
  });

  /// Returns a new [ApiListTaskRes] instance and optionally import its values from
  /// [json] if it's non-null.
  ApiListTaskRes.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      tasks = ApiTask.listFromJson(json['tasks']);
    }
  }

  
  List<ApiTask> tasks;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ApiListTaskRes &&
     other.tasks == tasks;

  @override
  int get hashCode =>
    tasks.hashCode;

  @override
  String toString() => 'ApiListTaskRes[tasks=$tasks]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (tasks != null) {
      json['tasks'] = tasks;
    }
    return json;
  }

  static List<ApiListTaskRes> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <ApiListTaskRes>[]
      : json.map((v) => ApiListTaskRes.fromJson(v)).toList(growable: true == growable);

  static Map<String, ApiListTaskRes> mapFromJson(Map<String, dynamic> json) {
    final map = <String, ApiListTaskRes>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = ApiListTaskRes.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of ApiListTaskRes-objects as value to a dart map
  static Map<String, List<ApiListTaskRes>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<ApiListTaskRes>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = ApiListTaskRes.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

