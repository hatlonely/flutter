part of openapi.api;

class ApiRunTaskRes {
  
  String jobID = null;
  ApiRunTaskRes();

  @override
  String toString() {
    return 'ApiRunTaskRes[jobID=$jobID, ]';
  }

  ApiRunTaskRes.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    jobID = json['jobID'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (jobID != null)
      json['jobID'] = jobID;
    return json;
  }

  static List<ApiRunTaskRes> listFromJson(List<dynamic> json) {
    return json == null ? List<ApiRunTaskRes>() : json.map((value) => ApiRunTaskRes.fromJson(value)).toList();
  }

  static Map<String, ApiRunTaskRes> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ApiRunTaskRes>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = ApiRunTaskRes.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of ApiRunTaskRes-objects as value to a dart map
  static Map<String, List<ApiRunTaskRes>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<ApiRunTaskRes>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = ApiRunTaskRes.listFromJson(value);
       });
     }
     return map;
  }
}

