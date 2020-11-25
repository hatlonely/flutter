part of swagger.api;

class ApiListTaskRes {
  
  List<ApiTask> tasks = [];
  
  ApiListTaskRes();

  @override
  String toString() {
    return 'ApiListTaskRes[tasks=$tasks, ]';
  }

  ApiListTaskRes.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    tasks =
      ApiTask.listFromJson(json['tasks'])
;
  }

  Map<String, dynamic> toJson() {
    return {
      'tasks': tasks
     };
  }

  static List<ApiListTaskRes> listFromJson(List<dynamic> json) {
    return json == null ? new List<ApiListTaskRes>() : json.map((value) => new ApiListTaskRes.fromJson(value)).toList();
  }

  static Map<String, ApiListTaskRes> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ApiListTaskRes>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ApiListTaskRes.fromJson(value));
    }
    return map;
  }
}

