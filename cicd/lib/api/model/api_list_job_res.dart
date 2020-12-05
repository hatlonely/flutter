part of swagger.api;

class ApiListJobRes {
  
  List<ApiJob> jobs = [];
  
  ApiListJobRes();

  @override
  String toString() {
    return 'ApiListJobRes[jobs=$jobs, ]';
  }

  ApiListJobRes.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    jobs =
      ApiJob.listFromJson(json['jobs'])
;
  }

  Map<String, dynamic> toJson() {
    return {
      'jobs': jobs
     };
  }

  static List<ApiListJobRes> listFromJson(List<dynamic> json) {
    return json == null ? new List<ApiListJobRes>() : json.map((value) => new ApiListJobRes.fromJson(value)).toList();
  }

  static Map<String, ApiListJobRes> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ApiListJobRes>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ApiListJobRes.fromJson(value));
    }
    return map;
  }
}

