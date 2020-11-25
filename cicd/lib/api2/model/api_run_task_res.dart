part of swagger.api;

class ApiRunTaskRes {
  
  String jobID = null;
  

  String exitCode = null;
  

  String stdout = null;
  

  String stderr = null;
  
  ApiRunTaskRes();

  @override
  String toString() {
    return 'ApiRunTaskRes[jobID=$jobID, exitCode=$exitCode, stdout=$stdout, stderr=$stderr, ]';
  }

  ApiRunTaskRes.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    jobID =
        json['jobID']
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
      'jobID': jobID,
      'exitCode': exitCode,
      'stdout': stdout,
      'stderr': stderr
     };
  }

  static List<ApiRunTaskRes> listFromJson(List<dynamic> json) {
    return json == null ? new List<ApiRunTaskRes>() : json.map((value) => new ApiRunTaskRes.fromJson(value)).toList();
  }

  static Map<String, ApiRunTaskRes> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ApiRunTaskRes>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ApiRunTaskRes.fromJson(value));
    }
    return map;
  }
}

