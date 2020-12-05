part of openapi.api;

class ApiGetTemplatesReq {
  
  List<String> ids = [];
  ApiGetTemplatesReq();

  @override
  String toString() {
    return 'ApiGetTemplatesReq[ids=$ids, ]';
  }

  ApiGetTemplatesReq.fromJson(Map<String, dynamic> json) {
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

  static List<ApiGetTemplatesReq> listFromJson(List<dynamic> json) {
    return json == null ? List<ApiGetTemplatesReq>() : json.map((value) => ApiGetTemplatesReq.fromJson(value)).toList();
  }

  static Map<String, ApiGetTemplatesReq> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ApiGetTemplatesReq>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = ApiGetTemplatesReq.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of ApiGetTemplatesReq-objects as value to a dart map
  static Map<String, List<ApiGetTemplatesReq>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<ApiGetTemplatesReq>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = ApiGetTemplatesReq.listFromJson(value);
       });
     }
     return map;
  }
}

