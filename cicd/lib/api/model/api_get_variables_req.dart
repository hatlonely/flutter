part of openapi.api;

class ApiGetVariablesReq {
  
  List<String> ids = [];
  ApiGetVariablesReq();

  @override
  String toString() {
    return 'ApiGetVariablesReq[ids=$ids, ]';
  }

  ApiGetVariablesReq.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    ids = (json['ids'] == null) ?
      null :
      (json['ids'] as List).cast<String>();
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (ids != null)
      json['ids'] = ids;
    return json;
  }

  static List<ApiGetVariablesReq> listFromJson(List<dynamic> json) {
    return json == null ? List<ApiGetVariablesReq>() : json.map((value) => ApiGetVariablesReq.fromJson(value)).toList();
  }

  static Map<String, ApiGetVariablesReq> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ApiGetVariablesReq>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = ApiGetVariablesReq.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of ApiGetVariablesReq-objects as value to a dart map
  static Map<String, List<ApiGetVariablesReq>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<ApiGetVariablesReq>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = ApiGetVariablesReq.listFromJson(value);
       });
     }
     return map;
  }
}

