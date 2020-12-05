//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ApiListTemplateRes {
  /// Returns a new [ApiListTemplateRes] instance.
  ApiListTemplateRes({
    this.templates = const [],
  });

  /// Returns a new [ApiListTemplateRes] instance and optionally import its values from
  /// [json] if it's non-null.
  ApiListTemplateRes.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      templates = ApiTemplate.listFromJson(json['templates']);
    }
  }

  
  List<ApiTemplate> templates;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ApiListTemplateRes &&
     other.templates == templates;

  @override
  int get hashCode =>
    templates.hashCode;

  @override
  String toString() => 'ApiListTemplateRes[templates=$templates]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (templates != null) {
      json['templates'] = templates;
    }
    return json;
  }

  static List<ApiListTemplateRes> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <ApiListTemplateRes>[]
      : json.map((v) => ApiListTemplateRes.fromJson(v)).toList(growable: true == growable);

  static Map<String, ApiListTemplateRes> mapFromJson(Map<String, dynamic> json) {
    final map = <String, ApiListTemplateRes>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = ApiListTemplateRes.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of ApiListTemplateRes-objects as value to a dart map
  static Map<String, List<ApiListTemplateRes>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<ApiListTemplateRes>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = ApiListTemplateRes.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

