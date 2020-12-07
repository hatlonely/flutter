part of openapi.api;

class ApiTemplate {
  
  String id = null;
  
  String name = null;
  
  String description = null;
  
  String type = null;
  
  String category = null;
  
  int createAt = null;
  
  int updateAt = null;
  
  TemplateScriptTemplate scriptTemplate = null;
  ApiTemplate();

  @override
  String toString() {
    return 'ApiTemplate[id=$id, name=$name, description=$description, type=$type, category=$category, createAt=$createAt, updateAt=$updateAt, scriptTemplate=$scriptTemplate, ]';
  }

  ApiTemplate.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
    description = json['description'];
    type = json['type'];
    category = json['category'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
    scriptTemplate = (json['scriptTemplate'] == null) ?
      null :
      TemplateScriptTemplate.fromJson(json['scriptTemplate']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (name != null)
      json['name'] = name;
    if (description != null)
      json['description'] = description;
    if (type != null)
      json['type'] = type;
    if (category != null)
      json['category'] = category;
    if (createAt != null)
      json['createAt'] = createAt;
    if (updateAt != null)
      json['updateAt'] = updateAt;
    if (scriptTemplate != null)
      json['scriptTemplate'] = scriptTemplate;
    return json;
  }

  static List<ApiTemplate> listFromJson(List<dynamic> json) {
    return json == null ? List<ApiTemplate>() : json.map((value) => ApiTemplate.fromJson(value)).toList();
  }

  static Map<String, ApiTemplate> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ApiTemplate>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = ApiTemplate.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of ApiTemplate-objects as value to a dart map
  static Map<String, List<ApiTemplate>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<ApiTemplate>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = ApiTemplate.listFromJson(value);
       });
     }
     return map;
  }
}

