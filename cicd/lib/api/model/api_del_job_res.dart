part of openapi.api;

class ApiDelJobRes {
  
  String id = null;
  ApiDelJobRes();

  @override
  String toString() {
    return 'ApiDelJobRes[id=$id, ]';
  }

  ApiDelJobRes.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    return json;
  }

  static List<ApiDelJobRes> listFromJson(List<dynamic> json) {
    return json == null ? List<ApiDelJobRes>() : json.map((value) => ApiDelJobRes.fromJson(value)).toList();
  }

  static Map<String, ApiDelJobRes> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ApiDelJobRes>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = ApiDelJobRes.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of ApiDelJobRes-objects as value to a dart map
  static Map<String, List<ApiDelJobRes>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<ApiDelJobRes>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = ApiDelJobRes.listFromJson(value);
       });
     }
     return map;
  }
}

