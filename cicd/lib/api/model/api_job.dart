part of swagger.api;

class ApiJob {
  
  String id = null;
  

  String taskID = null;
  

  String taskName = null;
  

  String status = null;
  

  String error = null;
  

  int createAt = null;
  

  int updateAt = null;
  

  List<JobSub> subs = [];
  
  ApiJob();

  @override
  String toString() {
    return 'ApiJob[id=$id, taskID=$taskID, taskName=$taskName, status=$status, error=$error, createAt=$createAt, updateAt=$updateAt, subs=$subs, ]';
  }

  ApiJob.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
    taskID =
        json['taskID']
    ;
    taskName =
        json['taskName']
    ;
    status =
        json['status']
    ;
    error =
        json['error']
    ;
    createAt =
        json['createAt']
    ;
    updateAt =
        json['updateAt']
    ;
    subs =
      JobSub.listFromJson(json['subs'])
;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'taskID': taskID,
      'taskName': taskName,
      'status': status,
      'error': error,
      'createAt': createAt,
      'updateAt': updateAt,
      'subs': subs
     };
  }

  static List<ApiJob> listFromJson(List<dynamic> json) {
    return json == null ? new List<ApiJob>() : json.map((value) => new ApiJob.fromJson(value)).toList();
  }

  static Map<String, ApiJob> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ApiJob>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ApiJob.fromJson(value));
    }
    return map;
  }
}

