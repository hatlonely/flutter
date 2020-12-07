part of openapi.api;

class ApiDelVariableRes {
  
  String id = null;
  ApiDelVariableRes();

  @override
  String toString() {
    return 'ApiDelVariableRes[id=$id, ]';
  }

  ApiDelVariableRes.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    return json;
  }

  static List<ApiDelVariableRes> listFromJson(List<dynamic> json) {
    return json == null ? List<ApiDelVariableRes>() : json.map((value) => ApiDelVariableRes.fromJson(value)).toList();
  }

  static Map<String, ApiDelVariableRes> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ApiDelVariableRes>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = ApiDelVariableRes.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of ApiDelVariableRes-objects as value to a dart map
  static Map<String, List<ApiDelVariableRes>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<ApiDelVariableRes>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = ApiDelVariableRes.listFromJson(value);
       });
     }
     return map;
  }
}

