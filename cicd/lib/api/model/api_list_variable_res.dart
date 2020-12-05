part of swagger.api;

class ApiListVariableRes {
  
  List<ApiVariable> variables = [];
  
  ApiListVariableRes();

  @override
  String toString() {
    return 'ApiListVariableRes[variables=$variables, ]';
  }

  ApiListVariableRes.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    variables =
      ApiVariable.listFromJson(json['variables'])
;
  }

  Map<String, dynamic> toJson() {
    return {
      'variables': variables
     };
  }

  static List<ApiListVariableRes> listFromJson(List<dynamic> json) {
    return json == null ? new List<ApiListVariableRes>() : json.map((value) => new ApiListVariableRes.fromJson(value)).toList();
  }

  static Map<String, ApiListVariableRes> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ApiListVariableRes>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ApiListVariableRes.fromJson(value));
    }
    return map;
  }
}

