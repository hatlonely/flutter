//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ApiRunTaskRes {
  /// Returns a new [ApiRunTaskRes] instance.
  ApiRunTaskRes({
    this.jobID,
  });

  /// Returns a new [ApiRunTaskRes] instance and optionally import its values from
  /// [json] if it's non-null.
  ApiRunTaskRes.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      jobID = json['jobID'];
    }
  }

  
  String jobID;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ApiRunTaskRes &&
     other.jobID == jobID;

  @override
  int get hashCode =>
    jobID.hashCode;

  @override
  String toString() => 'ApiRunTaskRes[jobID=$jobID]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (jobID != null) {
      json['jobID'] = jobID;
    }
    return json;
  }

  static List<ApiRunTaskRes> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <ApiRunTaskRes>[]
      : json.map((v) => ApiRunTaskRes.fromJson(v)).toList(growable: true == growable);

  static Map<String, ApiRunTaskRes> mapFromJson(Map<String, dynamic> json) {
    final map = <String, ApiRunTaskRes>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = ApiRunTaskRes.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of ApiRunTaskRes-objects as value to a dart map
  static Map<String, List<ApiRunTaskRes>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<ApiRunTaskRes>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = ApiRunTaskRes.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

