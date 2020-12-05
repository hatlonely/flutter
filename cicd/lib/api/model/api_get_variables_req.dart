part of swagger.api;

class ApiGetVariablesReq {
  
  List<String> ids = [];
  
  ApiGetVariablesReq();

  @override
  String toString() {
    return 'ApiGetVariablesReq[ids=$ids, ]';
  }

  ApiGetVariablesReq.fromJson(Map<String, dynamic> json) {
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

  static List<ApiGetVariablesReq> listFromJson(List<dynamic> json) {
    return json == null ? new List<ApiGetVariablesReq>() : json.map((value) => new ApiGetVariablesReq.fromJson(value)).toList();
  }

  static Map<String, ApiGetVariablesReq> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ApiGetVariablesReq>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ApiGetVariablesReq.fromJson(value));
    }
    return map;
  }
}

