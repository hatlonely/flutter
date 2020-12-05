//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ApiTask {
  /// Returns a new [ApiTask] instance.
  ApiTask({
    this.id,
    this.name,
    this.description,
    this.templateIDs = const [],
    this.variableIDs = const [],
  });

  /// Returns a new [ApiTask] instance and optionally import its values from
  /// [json] if it's non-null.
  ApiTask.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      id = json['id'];
      name = json['name'];
      description = json['description'];
      templateIDs = json['templateIDs'] == null
        ? null
        : (json['templateIDs'] as List).cast<String>();
      variableIDs = json['variableIDs'] == null
        ? null
        : (json['variableIDs'] as List).cast<String>();
    }
  }

  
  String id;

  
  String name;

  
  String description;

  
  List<String> templateIDs;

  
  List<String> variableIDs;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ApiTask &&
     other.id == id &&
     other.name == name &&
     other.description == description &&
     other.templateIDs == templateIDs &&
     other.variableIDs == variableIDs;

  @override
  int get hashCode =>
    id.hashCode +
    name.hashCode +
    description.hashCode +
    templateIDs.hashCode +
    variableIDs.hashCode;

  @override
  String toString() => 'ApiTask[id=$id, name=$name, description=$description, templateIDs=$templateIDs, variableIDs=$variableIDs]';

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
    if (templateIDs != null) {
      json['templateIDs'] = templateIDs;
    }
    if (variableIDs != null) {
      json['variableIDs'] = variableIDs;
    }
    return json;
  }

  static List<ApiTask> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <ApiTask>[]
      : json.map((v) => ApiTask.fromJson(v)).toList(growable: true == growable);

  static Map<String, ApiTask> mapFromJson(Map<String, dynamic> json) {
    final map = <String, ApiTask>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = ApiTask.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of ApiTask-objects as value to a dart map
  static Map<String, List<ApiTask>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<ApiTask>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = ApiTask.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

