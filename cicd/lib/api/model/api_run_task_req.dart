//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ApiRunTaskReq {
  /// Returns a new [ApiRunTaskReq] instance.
  ApiRunTaskReq({
    this.taskID,
  });

  /// Returns a new [ApiRunTaskReq] instance and optionally import its values from
  /// [json] if it's non-null.
  ApiRunTaskReq.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      taskID = json['taskID'];
    }
  }

  
  String taskID;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ApiRunTaskReq &&
     other.taskID == taskID;

  @override
  int get hashCode =>
    taskID.hashCode;

  @override
  String toString() => 'ApiRunTaskReq[taskID=$taskID]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (taskID != null) {
      json['taskID'] = taskID;
    }
    return json;
  }

  static List<ApiRunTaskReq> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <ApiRunTaskReq>[]
      : json.map((v) => ApiRunTaskReq.fromJson(v)).toList(growable: true == growable);

  static Map<String, ApiRunTaskReq> mapFromJson(Map<String, dynamic> json) {
    final map = <String, ApiRunTaskReq>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = ApiRunTaskReq.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of ApiRunTaskReq-objects as value to a dart map
  static Map<String, List<ApiRunTaskReq>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<ApiRunTaskReq>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = ApiRunTaskReq.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

