part of swagger.api;

class JobSub {
  
  String templateID = null;
  

  String templateName = null;
  

  String status = null;
  

  String language = null;
  

  String script = null;
  

  int exitCode = null;
  

  String stdout = null;
  

  String stderr = null;
  
  JobSub();

  @override
  String toString() {
    return 'JobSub[templateID=$templateID, templateName=$templateName, status=$status, language=$language, script=$script, exitCode=$exitCode, stdout=$stdout, stderr=$stderr, ]';
  }

  JobSub.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    templateID =
        json['templateID']
    ;
    templateName =
        json['templateName']
    ;
    status =
        json['status']
    ;
    language =
        json['language']
    ;
    script =
        json['script']
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
      'templateName': templateName,
      'status': status,
      'language': language,
      'script': script,
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

