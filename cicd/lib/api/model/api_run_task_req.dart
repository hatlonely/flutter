part of swagger.api;

class ApiRunTaskReq {
  
  String taskID = null;
  
  ApiRunTaskReq();

  @override
  String toString() {
    return 'ApiRunTaskReq[taskID=$taskID, ]';
  }

  ApiRunTaskReq.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    taskID =
        json['taskID']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'taskID': taskID
     };
  }

  static List<ApiRunTaskReq> listFromJson(List<dynamic> json) {
    return json == null ? new List<ApiRunTaskReq>() : json.map((value) => new ApiRunTaskReq.fromJson(value)).toList();
  }

  static Map<String, ApiRunTaskReq> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ApiRunTaskReq>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ApiRunTaskReq.fromJson(value));
    }
    return map;
  }
}

