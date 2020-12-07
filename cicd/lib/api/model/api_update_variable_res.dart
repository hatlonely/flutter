part of openapi.api;

class ApiUpdateVariableRes {
  
  String id = null;
  ApiUpdateVariableRes();

  @override
  String toString() {
    return 'ApiUpdateVariableRes[id=$id, ]';
  }

  ApiUpdateVariableRes.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    return json;
  }

  static List<ApiUpdateVariableRes> listFromJson(List<dynamic> json) {
    return json == null ? List<ApiUpdateVariableRes>() : json.map((value) => ApiUpdateVariableRes.fromJson(value)).toList();
  }

  static Map<String, ApiUpdateVariableRes> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ApiUpdateVariableRes>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = ApiUpdateVariableRes.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of ApiUpdateVariableRes-objects as value to a dart map
  static Map<String, List<ApiUpdateVariableRes>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<ApiUpdateVariableRes>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = ApiUpdateVariableRes.listFromJson(value);
       });
     }
     return map;
  }
}

