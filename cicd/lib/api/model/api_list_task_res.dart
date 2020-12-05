part of openapi.api;

class ApiListTaskRes {
  
  List<ApiTask> tasks = [];
  ApiListTaskRes();

  @override
  String toString() {
    return 'ApiListTaskRes[tasks=$tasks, ]';
  }

  ApiListTaskRes.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    tasks = (json['tasks'] == null) ?
      null :
      ApiTask.listFromJson(json['tasks']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (tasks != null)
      json['tasks'] = tasks;
    return json;
  }

  static List<ApiListTaskRes> listFromJson(List<dynamic> json) {
    return json == null ? List<ApiListTaskRes>() : json.map((value) => ApiListTaskRes.fromJson(value)).toList();
  }

  static Map<String, ApiListTaskRes> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ApiListTaskRes>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = ApiListTaskRes.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of ApiListTaskRes-objects as value to a dart map
  static Map<String, List<ApiListTaskRes>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<ApiListTaskRes>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = ApiListTaskRes.listFromJson(value);
       });
     }
     return map;
  }
}

