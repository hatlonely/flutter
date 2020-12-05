part of swagger.api;

class ApiVariable {
  
  String id = null;
  

  String name = null;
  

  String description = null;
  

  String kvs = null;
  
  ApiVariable();

  @override
  String toString() {
    return 'ApiVariable[id=$id, name=$name, description=$description, kvs=$kvs, ]';
  }

  ApiVariable.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
    name =
        json['name']
    ;
    description =
        json['description']
    ;
    kvs =
        json['kvs']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'kvs': kvs
     };
  }

  static List<ApiVariable> listFromJson(List<dynamic> json) {
    return json == null ? new List<ApiVariable>() : json.map((value) => new ApiVariable.fromJson(value)).toList();
  }

  static Map<String, ApiVariable> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ApiVariable>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ApiVariable.fromJson(value));
    }
    return map;
  }
}

