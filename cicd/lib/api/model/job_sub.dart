part of swagger.api;

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
    templateID =
        json['templateID']
    ;
    status =
        json['status']
    ;
    exitCode =
        json['exitCode']
    ;
    stdout =
        json['stdout']
    ;
    stderr =
        json['stderr']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'templateID': templateID,
      'status': status,
      'exitCode': exitCode,
      'stdout': stdout,
      'stderr': stderr
     };
  }

  static List<JobSub> listFromJson(List<dynamic> json) {
    return json == null ? new List<JobSub>() : json.map((value) => new JobSub.fromJson(value)).toList();
  }

  static Map<String, JobSub> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, JobSub>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new JobSub.fromJson(value));
    }
    return map;
  }
}

