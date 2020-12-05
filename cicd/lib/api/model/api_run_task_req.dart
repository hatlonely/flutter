part of openapi.api;

class ApiRunTaskReq {
  
  String taskID = null;
  ApiRunTaskReq();

  @override
  String toString() {
    return 'ApiRunTaskReq[taskID=$taskID, ]';
  }

  ApiRunTaskReq.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    taskID = json['taskID'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (taskID != null)
      json['taskID'] = taskID;
    return json;
  }

  static List<ApiRunTaskReq> listFromJson(List<dynamic> json) {
    return json == null ? List<ApiRunTaskReq>() : json.map((value) => ApiRunTaskReq.fromJson(value)).toList();
  }

  static Map<String, ApiRunTaskReq> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ApiRunTaskReq>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = ApiRunTaskReq.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of ApiRunTaskReq-objects as value to a dart map
  static Map<String, List<ApiRunTaskReq>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<ApiRunTaskReq>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = ApiRunTaskReq.listFromJson(value);
       });
     }
     return map;
  }
}

