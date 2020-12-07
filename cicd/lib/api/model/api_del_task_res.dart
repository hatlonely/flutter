part of openapi.api;

class ApiDelTaskRes {
  
  String id = null;
  ApiDelTaskRes();

  @override
  String toString() {
    return 'ApiDelTaskRes[id=$id, ]';
  }

  ApiDelTaskRes.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    return json;
  }

  static List<ApiDelTaskRes> listFromJson(List<dynamic> json) {
    return json == null ? List<ApiDelTaskRes>() : json.map((value) => ApiDelTaskRes.fromJson(value)).toList();
  }

  static Map<String, ApiDelTaskRes> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ApiDelTaskRes>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = ApiDelTaskRes.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of ApiDelTaskRes-objects as value to a dart map
  static Map<String, List<ApiDelTaskRes>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<ApiDelTaskRes>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = ApiDelTaskRes.listFromJson(value);
       });
     }
     return map;
  }
}

