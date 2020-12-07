part of openapi.api;

class ApiUpdateTaskRes {
  
  String id = null;
  ApiUpdateTaskRes();

  @override
  String toString() {
    return 'ApiUpdateTaskRes[id=$id, ]';
  }

  ApiUpdateTaskRes.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    return json;
  }

  static List<ApiUpdateTaskRes> listFromJson(List<dynamic> json) {
    return json == null ? List<ApiUpdateTaskRes>() : json.map((value) => ApiUpdateTaskRes.fromJson(value)).toList();
  }

  static Map<String, ApiUpdateTaskRes> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ApiUpdateTaskRes>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = ApiUpdateTaskRes.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of ApiUpdateTaskRes-objects as value to a dart map
  static Map<String, List<ApiUpdateTaskRes>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<ApiUpdateTaskRes>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = ApiUpdateTaskRes.listFromJson(value);
       });
     }
     return map;
  }
}

