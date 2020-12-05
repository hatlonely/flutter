//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TemplateScriptTemplate {
  /// Returns a new [TemplateScriptTemplate] instance.
  TemplateScriptTemplate({
    this.language,
    this.script,
  });

  /// Returns a new [TemplateScriptTemplate] instance and optionally import its values from
  /// [json] if it's non-null.
  TemplateScriptTemplate.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      language = json['language'];
      script = json['script'];
    }
  }

  
  String language;

  
  String script;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TemplateScriptTemplate &&
     other.language == language &&
     other.script == script;

  @override
  int get hashCode =>
    language.hashCode +
    script.hashCode;

  @override
  String toString() => 'TemplateScriptTemplate[language=$language, script=$script]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (language != null) {
      json['language'] = language;
    }
    if (script != null) {
      json['script'] = script;
    }
    return json;
  }

  static List<TemplateScriptTemplate> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <TemplateScriptTemplate>[]
      : json.map((v) => TemplateScriptTemplate.fromJson(v)).toList(growable: true == growable);

  static Map<String, TemplateScriptTemplate> mapFromJson(Map<String, dynamic> json) {
    final map = <String, TemplateScriptTemplate>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = TemplateScriptTemplate.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of TemplateScriptTemplate-objects as value to a dart map
  static Map<String, List<TemplateScriptTemplate>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<TemplateScriptTemplate>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = TemplateScriptTemplate.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

