//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ApiTemplate {
  /// Returns a new [ApiTemplate] instance.
  ApiTemplate({
    this.id,
    this.name,
    this.description,
    this.type,
    this.category,
    this.scriptTemplate,
  });

  /// Returns a new [ApiTemplate] instance and optionally import its values from
  /// [json] if it's non-null.
  ApiTemplate.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      id = json['id'];
      name = json['name'];
      description = json['description'];
      type = json['type'];
      category = json['category'];
      scriptTemplate = TemplateScriptTemplate.fromJson(json['scriptTemplate']);
    }
  }

  
  String id;

  
  String name;

  
  String description;

  
  String type;

  
  String category;

  
  TemplateScriptTemplate scriptTemplate;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ApiTemplate &&
     other.id == id &&
     other.name == name &&
     other.description == description &&
     other.type == type &&
     other.category == category &&
     other.scriptTemplate == scriptTemplate;

  @override
  int get hashCode =>
    id.hashCode +
    name.hashCode +
    description.hashCode +
    type.hashCode +
    category.hashCode +
    scriptTemplate.hashCode;

  @override
  String toString() => 'ApiTemplate[id=$id, name=$name, description=$description, type=$type, category=$category, scriptTemplate=$scriptTemplate]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json['id'] = id;
    }
    if (name != null) {
      json['name'] = name;
    }
    if (description != null) {
      json['description'] = description;
    }
    if (type != null) {
      json['type'] = type;
    }
    if (category != null) {
      json['category'] = category;
    }
    if (scriptTemplate != null) {
      json['scriptTemplate'] = scriptTemplate;
    }
    return json;
  }

  static List<ApiTemplate> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <ApiTemplate>[]
      : json.map((v) => ApiTemplate.fromJson(v)).toList(growable: true == growable);

  static Map<String, ApiTemplate> mapFromJson(Map<String, dynamic> json) {
    final map = <String, ApiTemplate>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = ApiTemplate.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of ApiTemplate-objects as value to a dart map
  static Map<String, List<ApiTemplate>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<ApiTemplate>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = ApiTemplate.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

