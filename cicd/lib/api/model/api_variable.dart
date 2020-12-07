part of openapi.api;

class ApiVariable {
  
  String id = null;
  
  String name = null;
  
  String description = null;
  
  String kvs = null;
  
  int createAt = null;
  
  int updateAt = null;
  ApiVariable();

  @override
  String toString() {
    return 'ApiVariable[id=$id, name=$name, description=$description, kvs=$kvs, createAt=$createAt, updateAt=$updateAt, ]';
  }

  ApiVariable.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
    description = json['description'];
    kvs = json['kvs'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (name != null)
      json['name'] = name;
    if (description != null)
      json['description'] = description;
    if (kvs != null)
      json['kvs'] = kvs;
    if (createAt != null)
      json['createAt'] = createAt;
    if (updateAt != null)
      json['updateAt'] = updateAt;
    return json;
  }

  static List<ApiVariable> listFromJson(List<dynamic> json) {
    return json == null ? List<ApiVariable>() : json.map((value) => ApiVariable.fromJson(value)).toList();
  }

  static Map<String, ApiVariable> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ApiVariable>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = ApiVariable.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of ApiVariable-objects as value to a dart map
  static Map<String, List<ApiVariable>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<ApiVariable>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = ApiVariable.listFromJson(value);
       });
     }
     return map;
  }
}

