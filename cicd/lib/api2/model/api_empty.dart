part of swagger.api;

class ApiEmpty {
    ApiEmpty();

  @override
  String toString() {
    return 'ApiEmpty[]';
  }

  ApiEmpty.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<ApiEmpty> listFromJson(List<dynamic> json) {
    return json == null ? new List<ApiEmpty>() : json.map((value) => new ApiEmpty.fromJson(value)).toList();
  }

  static Map<String, ApiEmpty> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ApiEmpty>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ApiEmpty.fromJson(value));
    }
    return map;
  }
}

