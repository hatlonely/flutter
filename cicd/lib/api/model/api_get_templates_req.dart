part of swagger.api;

class ApiGetTemplatesReq {
  
  List<String> ids = [];
  
  ApiGetTemplatesReq();

  @override
  String toString() {
    return 'ApiGetTemplatesReq[ids=$ids, ]';
  }

  ApiGetTemplatesReq.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    ids =
        (json['ids'] as List).map((item) => item as String).toList()
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'ids': ids
     };
  }

  static List<ApiGetTemplatesReq> listFromJson(List<dynamic> json) {
    return json == null ? new List<ApiGetTemplatesReq>() : json.map((value) => new ApiGetTemplatesReq.fromJson(value)).toList();
  }

  static Map<String, ApiGetTemplatesReq> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ApiGetTemplatesReq>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ApiGetTemplatesReq.fromJson(value));
    }
    return map;
  }
}

