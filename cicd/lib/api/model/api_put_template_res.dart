part of openapi.api;

class ApiPutTemplateRes {
  
  String id = null;
  ApiPutTemplateRes();

  @override
  String toString() {
    return 'ApiPutTemplateRes[id=$id, ]';
  }

  ApiPutTemplateRes.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    return json;
  }

  static List<ApiPutTemplateRes> listFromJson(List<dynamic> json) {
    return json == null ? List<ApiPutTemplateRes>() : json.map((value) => ApiPutTemplateRes.fromJson(value)).toList();
  }

  static Map<String, ApiPutTemplateRes> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ApiPutTemplateRes>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = ApiPutTemplateRes.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of ApiPutTemplateRes-objects as value to a dart map
  static Map<String, List<ApiPutTemplateRes>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<ApiPutTemplateRes>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = ApiPutTemplateRes.listFromJson(value);
       });
     }
     return map;
  }
}

