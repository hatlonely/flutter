//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ApiGetVariablesReq {
  /// Returns a new [ApiGetVariablesReq] instance.
  ApiGetVariablesReq({
    this.ids = const [],
  });

  /// Returns a new [ApiGetVariablesReq] instance and optionally import its values from
  /// [json] if it's non-null.
  ApiGetVariablesReq.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      ids = json['ids'] == null
        ? null
        : (json['ids'] as List).cast<String>();
    }
  }

  
  List<String> ids;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ApiGetVariablesReq &&
     other.ids == ids;

  @override
  int get hashCode =>
    ids.hashCode;

  @override
  String toString() => 'ApiGetVariablesReq[ids=$ids]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (ids != null) {
      json['ids'] = ids;
    }
    return json;
  }

  static List<ApiGetVariablesReq> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <ApiGetVariablesReq>[]
      : json.map((v) => ApiGetVariablesReq.fromJson(v)).toList(growable: true == growable);

  static Map<String, ApiGetVariablesReq> mapFromJson(Map<String, dynamic> json) {
    final map = <String, ApiGetVariablesReq>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = ApiGetVariablesReq.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of ApiGetVariablesReq-objects as value to a dart map
  static Map<String, List<ApiGetVariablesReq>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<ApiGetVariablesReq>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = ApiGetVariablesReq.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

