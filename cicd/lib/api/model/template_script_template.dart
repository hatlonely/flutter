part of openapi.api;

class TemplateScriptTemplate {
  
  String language = null;
  
  String script = null;
  TemplateScriptTemplate();

  @override
  String toString() {
    return 'TemplateScriptTemplate[language=$language, script=$script, ]';
  }

  TemplateScriptTemplate.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    language = json['language'];
    script = json['script'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (language != null)
      json['language'] = language;
    if (script != null)
      json['script'] = script;
    return json;
  }

  static List<TemplateScriptTemplate> listFromJson(List<dynamic> json) {
    return json == null ? List<TemplateScriptTemplate>() : json.map((value) => TemplateScriptTemplate.fromJson(value)).toList();
  }

  static Map<String, TemplateScriptTemplate> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, TemplateScriptTemplate>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = TemplateScriptTemplate.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of TemplateScriptTemplate-objects as value to a dart map
  static Map<String, List<TemplateScriptTemplate>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<TemplateScriptTemplate>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = TemplateScriptTemplate.listFromJson(value);
       });
     }
     return map;
  }
}

