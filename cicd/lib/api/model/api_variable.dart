//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ApiVariable {
  /// Returns a new [ApiVariable] instance.
  ApiVariable({
    this.id,
    this.name,
    this.description,
    this.kvs,
  });

  /// Returns a new [ApiVariable] instance and optionally import its values from
  /// [json] if it's non-null.
  ApiVariable.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      id = json['id'];
      name = json['name'];
      description = json['description'];
      kvs = json['kvs'];
    }
  }

  
  String id;

  
  String name;

  
  String description;

  
  String kvs;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ApiVariable &&
     other.id == id &&
     other.name == name &&
     other.description == description &&
     other.kvs == kvs;

  @override
  int get hashCode =>
    id.hashCode +
    name.hashCode +
    description.hashCode +
    kvs.hashCode;

  @override
  String toString() => 'ApiVariable[id=$id, name=$name, description=$description, kvs=$kvs]';

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
    if (kvs != null) {
      json['kvs'] = kvs;
    }
    return json;
  }

  static List<ApiVariable> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <ApiVariable>[]
      : json.map((v) => ApiVariable.fromJson(v)).toList(growable: true == growable);

  static Map<String, ApiVariable> mapFromJson(Map<String, dynamic> json) {
    final map = <String, ApiVariable>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = ApiVariable.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of ApiVariable-objects as value to a dart map
  static Map<String, List<ApiVariable>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<ApiVariable>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = ApiVariable.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

