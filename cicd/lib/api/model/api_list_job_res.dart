part of openapi.api;

class ApiListJobRes {
  
  List<ApiJob> jobs = [];
  ApiListJobRes();

  @override
  String toString() {
    return 'ApiListJobRes[jobs=$jobs, ]';
  }

  ApiListJobRes.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    jobs = (json['jobs'] == null) ?
      null :
      ApiJob.listFromJson(json['jobs']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (jobs != null)
      json['jobs'] = jobs;
    return json;
  }

  static List<ApiListJobRes> listFromJson(List<dynamic> json) {
    return json == null ? List<ApiListJobRes>() : json.map((value) => ApiListJobRes.fromJson(value)).toList();
  }

  static Map<String, ApiListJobRes> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ApiListJobRes>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = ApiListJobRes.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of ApiListJobRes-objects as value to a dart map
  static Map<String, List<ApiListJobRes>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<ApiListJobRes>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = ApiListJobRes.listFromJson(value);
       });
     }
     return map;
  }
}

