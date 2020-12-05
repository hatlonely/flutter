part of openapi.api;

class ApiListTemplateRes {
  
  List<ApiTemplate> templates = [];
  ApiListTemplateRes();

  @override
  String toString() {
    return 'ApiListTemplateRes[templates=$templates, ]';
  }

  ApiListTemplateRes.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    templates = (json['templates'] == null) ?
      null :
      ApiTemplate.listFromJson(json['templates']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (templates != null)
      json['templates'] = templates;
    return json;
  }

  static List<ApiListTemplateRes> listFromJson(List<dynamic> json) {
    return json == null ? List<ApiListTemplateRes>() : json.map((value) => ApiListTemplateRes.fromJson(value)).toList();
  }

  static Map<String, ApiListTemplateRes> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ApiListTemplateRes>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = ApiListTemplateRes.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of ApiListTemplateRes-objects as value to a dart map
  static Map<String, List<ApiListTemplateRes>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<ApiListTemplateRes>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = ApiListTemplateRes.listFromJson(value);
       });
     }
     return map;
  }
}

