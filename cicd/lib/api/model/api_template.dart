part of swagger.api;

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
    id =
        json['id']
    ;
    name =
        json['name']
    ;
    description =
        json['description']
    ;
    type =
        json['type']
    ;
    category =
        json['category']
    ;
    createAt =
        json['createAt']
    ;
    updateAt =
        json['updateAt']
    ;
    scriptTemplate =
      
      
      new TemplateScriptTemplate.fromJson(json['scriptTemplate'])
;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'type': type,
      'category': category,
      'createAt': createAt,
      'updateAt': updateAt,
      'scriptTemplate': scriptTemplate
     };
  }

  static List<ApiTemplate> listFromJson(List<dynamic> json) {
    return json == null ? new List<ApiTemplate>() : json.map((value) => new ApiTemplate.fromJson(value)).toList();
  }

  static Map<String, ApiTemplate> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ApiTemplate>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ApiTemplate.fromJson(value));
    }
    return map;
  }
}

