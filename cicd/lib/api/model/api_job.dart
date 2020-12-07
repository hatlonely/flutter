part of openapi.api;

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
    id = json['id'];
    taskID = json['taskID'];
    taskName = json['taskName'];
    status = json['status'];
    error = json['error'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
    subs = (json['subs'] == null) ?
      null :
      JobSub.listFromJson(json['subs']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (taskID != null)
      json['taskID'] = taskID;
    if (taskName != null)
      json['taskName'] = taskName;
    if (status != null)
      json['status'] = status;
    if (error != null)
      json['error'] = error;
    if (createAt != null)
      json['createAt'] = createAt;
    if (updateAt != null)
      json['updateAt'] = updateAt;
    if (subs != null)
      json['subs'] = subs;
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

