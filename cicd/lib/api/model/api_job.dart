part of openapi.api;

class ApiJob {
  
  String id = null;
  
  String taskID = null;
  
  String status = null;
  
  String error = null;
  
  List<JobSub> subs = [];
  
  int createAt = null;
  
  int updateAt = null;
  ApiJob();

  @override
  String toString() {
    return 'ApiJob[id=$id, taskID=$taskID, status=$status, error=$error, subs=$subs, createAt=$createAt, updateAt=$updateAt, ]';
  }

  ApiJob.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    taskID = json['taskID'];
    status = json['status'];
    error = json['error'];
    subs = (json['subs'] == null) ?
      null :
      JobSub.listFromJson(json['subs']);
    createAt = json['createAt'];
    updateAt = json['updateAt'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (taskID != null)
      json['taskID'] = taskID;
    if (status != null)
      json['status'] = status;
    if (error != null)
      json['error'] = error;
    if (subs != null)
      json['subs'] = subs;
    if (createAt != null)
      json['createAt'] = createAt;
    if (updateAt != null)
      json['updateAt'] = updateAt;
    return json;
  }

  static List<ApiJob> listFromJson(List<dynamic> json) {
    return json == null ? List<ApiJob>() : json.map((value) => ApiJob.fromJson(value)).toList();
  }

  static Map<String, ApiJob> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ApiJob>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = ApiJob.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of ApiJob-objects as value to a dart map
  static Map<String, List<ApiJob>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<ApiJob>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = ApiJob.listFromJson(value);
       });
     }
     return map;
  }
}

