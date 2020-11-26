part of swagger.api;

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
    language =
        json['language']
    ;
    script =
        json['script']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'language': language,
      'script': script
     };
  }

  static List<TemplateScriptTemplate> listFromJson(List<dynamic> json) {
    return json == null ? new List<TemplateScriptTemplate>() : json.map((value) => new TemplateScriptTemplate.fromJson(value)).toList();
  }

  static Map<String, TemplateScriptTemplate> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, TemplateScriptTemplate>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new TemplateScriptTemplate.fromJson(value));
    }
    return map;
  }
}

