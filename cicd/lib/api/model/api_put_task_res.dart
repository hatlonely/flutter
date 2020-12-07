part of openapi.api;

class ApiPutTaskRes {
  
  String id = null;
  ApiPutTaskRes();

  @override
  String toString() {
    return 'ApiPutTaskRes[id=$id, ]';
  }

  ApiPutTaskRes.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    return json;
  }

  static List<ApiPutTaskRes> listFromJson(List<dynamic> json) {
    return json == null ? List<ApiPutTaskRes>() : json.map((value) => ApiPutTaskRes.fromJson(value)).toList();
  }

  static Map<String, ApiPutTaskRes> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ApiPutTaskRes>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = ApiPutTaskRes.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of ApiPutTaskRes-objects as value to a dart map
  static Map<String, List<ApiPutTaskRes>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<ApiPutTaskRes>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = ApiPutTaskRes.listFromJson(value);
       });
     }
     return map;
  }
}

