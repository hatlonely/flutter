part of openapi.api;

class ApiDelTemplateRes {
  
  String id = null;
  ApiDelTemplateRes();

  @override
  String toString() {
    return 'ApiDelTemplateRes[id=$id, ]';
  }

  ApiDelTemplateRes.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    return json;
  }

  static List<ApiDelTemplateRes> listFromJson(List<dynamic> json) {
    return json == null ? List<ApiDelTemplateRes>() : json.map((value) => ApiDelTemplateRes.fromJson(value)).toList();
  }

  static Map<String, ApiDelTemplateRes> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ApiDelTemplateRes>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = ApiDelTemplateRes.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of ApiDelTemplateRes-objects as value to a dart map
  static Map<String, List<ApiDelTemplateRes>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<ApiDelTemplateRes>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = ApiDelTemplateRes.listFromJson(value);
       });
     }
     return map;
  }
}

