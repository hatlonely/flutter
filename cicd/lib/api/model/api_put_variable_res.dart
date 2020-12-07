part of openapi.api;

class ApiPutVariableRes {
  
  String id = null;
  ApiPutVariableRes();

  @override
  String toString() {
    return 'ApiPutVariableRes[id=$id, ]';
  }

  ApiPutVariableRes.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    return json;
  }

  static List<ApiPutVariableRes> listFromJson(List<dynamic> json) {
    return json == null ? List<ApiPutVariableRes>() : json.map((value) => ApiPutVariableRes.fromJson(value)).toList();
  }

  static Map<String, ApiPutVariableRes> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ApiPutVariableRes>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = ApiPutVariableRes.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of ApiPutVariableRes-objects as value to a dart map
  static Map<String, List<ApiPutVariableRes>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<ApiPutVariableRes>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = ApiPutVariableRes.listFromJson(value);
       });
     }
     return map;
  }
}

