part of openapi.api;

class JobSub {
  
  String templateID = null;
  
  String status = null;
  
  int exitCode = null;
  
  String stdout = null;
  
  String stderr = null;
  JobSub();

  @override
  String toString() {
    return 'JobSub[templateID=$templateID, status=$status, exitCode=$exitCode, stdout=$stdout, stderr=$stderr, ]';
  }

  JobSub.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    templateID = json['templateID'];
    status = json['status'];
    exitCode = json['exitCode'];
    stdout = json['stdout'];
    stderr = json['stderr'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (templateID != null)
      json['templateID'] = templateID;
    if (status != null)
      json['status'] = status;
    if (exitCode != null)
      json['exitCode'] = exitCode;
    if (stdout != null)
      json['stdout'] = stdout;
    if (stderr != null)
      json['stderr'] = stderr;
    return json;
  }

  static List<JobSub> listFromJson(List<dynamic> json) {
    return json == null ? List<JobSub>() : json.map((value) => JobSub.fromJson(value)).toList();
  }

  static Map<String, JobSub> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, JobSub>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = JobSub.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of JobSub-objects as value to a dart map
  static Map<String, List<JobSub>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<JobSub>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = JobSub.listFromJson(value);
       });
     }
     return map;
  }
}

