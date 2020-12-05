part of swagger.api;

class ApiGetVariableReq {
  
  String id = null;
  
  ApiGetVariableReq();

  @override
  String toString() {
    return 'ApiGetVariableReq[id=$id, ]';
  }

  ApiGetVariableReq.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id
     };
  }

  static List<ApiGetVariableReq> listFromJson(List<dynamic> json) {
    return json == null ? new List<ApiGetVariableReq>() : json.map((value) => new ApiGetVariableReq.fromJson(value)).toList();
  }

  static Map<String, ApiGetVariableReq> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ApiGetVariableReq>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ApiGetVariableReq.fromJson(value));
    }
    return map;
  }
}

