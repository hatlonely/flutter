//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ApiGetTemplatesReq {
  /// Returns a new [ApiGetTemplatesReq] instance.
  ApiGetTemplatesReq({
    this.ids = const [],
  });

  /// Returns a new [ApiGetTemplatesReq] instance and optionally import its values from
  /// [json] if it's non-null.
  ApiGetTemplatesReq.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      ids = json['ids'] == null
        ? null
        : (json['ids'] as List).cast<String>();
    }
  }

  
  List<String> ids;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ApiGetTemplatesReq &&
     other.ids == ids;

  @override
  int get hashCode =>
    ids.hashCode;

  @override
  String toString() => 'ApiGetTemplatesReq[ids=$ids]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (ids != null) {
      json['ids'] = ids;
    }
    return json;
  }

  static List<ApiGetTemplatesReq> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <ApiGetTemplatesReq>[]
      : json.map((v) => ApiGetTemplatesReq.fromJson(v)).toList(growable: true == growable);

  static Map<String, ApiGetTemplatesReq> mapFromJson(Map<String, dynamic> json) {
    final map = <String, ApiGetTemplatesReq>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = ApiGetTemplatesReq.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of ApiGetTemplatesReq-objects as value to a dart map
  static Map<String, List<ApiGetTemplatesReq>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<ApiGetTemplatesReq>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = ApiGetTemplatesReq.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

