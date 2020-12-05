part of openapi.api;

class ApiListVariableRes {
  
  List<ApiVariable> variables = [];
  ApiListVariableRes();

  @override
  String toString() {
    return 'ApiListVariableRes[variables=$variables, ]';
  }

  ApiListVariableRes.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    variables = (json['variables'] == null) ?
      null :
      ApiVariable.listFromJson(json['variables']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (variables != null)
      json['variables'] = variables;
    return json;
  }

  static List<ApiListVariableRes> listFromJson(List<dynamic> json) {
    return json == null ? List<ApiListVariableRes>() : json.map((value) => ApiListVariableRes.fromJson(value)).toList();
  }

  static Map<String, ApiListVariableRes> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ApiListVariableRes>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = ApiListVariableRes.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of ApiListVariableRes-objects as value to a dart map
  static Map<String, List<ApiListVariableRes>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<ApiListVariableRes>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = ApiListVariableRes.listFromJson(value);
       });
     }
     return map;
  }
}

