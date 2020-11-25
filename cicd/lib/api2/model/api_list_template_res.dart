part of swagger.api;

class ApiListTemplateRes {
  
  List<ApiTemplate> templates = [];
  
  ApiListTemplateRes();

  @override
  String toString() {
    return 'ApiListTemplateRes[templates=$templates, ]';
  }

  ApiListTemplateRes.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    templates =
      ApiTemplate.listFromJson(json['templates'])
;
  }

  Map<String, dynamic> toJson() {
    return {
      'templates': templates
     };
  }

  static List<ApiListTemplateRes> listFromJson(List<dynamic> json) {
    return json == null ? new List<ApiListTemplateRes>() : json.map((value) => new ApiListTemplateRes.fromJson(value)).toList();
  }

  static Map<String, ApiListTemplateRes> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ApiListTemplateRes>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ApiListTemplateRes.fromJson(value));
    }
    return map;
  }
}

