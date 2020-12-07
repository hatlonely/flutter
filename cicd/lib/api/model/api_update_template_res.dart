part of openapi.api;

class ApiUpdateTemplateRes {
  
  String id = null;
  ApiUpdateTemplateRes();

  @override
  String toString() {
    return 'ApiUpdateTemplateRes[id=$id, ]';
  }

  ApiUpdateTemplateRes.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    return json;
  }

  static List<ApiUpdateTemplateRes> listFromJson(List<dynamic> json) {
    return json == null ? List<ApiUpdateTemplateRes>() : json.map((value) => ApiUpdateTemplateRes.fromJson(value)).toList();
  }

  static Map<String, ApiUpdateTemplateRes> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ApiUpdateTemplateRes>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = ApiUpdateTemplateRes.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of ApiUpdateTemplateRes-objects as value to a dart map
  static Map<String, List<ApiUpdateTemplateRes>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<ApiUpdateTemplateRes>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = ApiUpdateTemplateRes.listFromJson(value);
       });
     }
     return map;
  }
}

