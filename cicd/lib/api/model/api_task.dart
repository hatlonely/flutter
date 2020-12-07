part of openapi.api;

class ApiTask {
  
  String id = null;
  
  String name = null;
  
  String description = null;
  
  List<String> templateIDs = [];
  
  List<String> variableIDs = [];
  
  int createAt = null;
  
  int updateAt = null;
  ApiTask();

  @override
  String toString() {
    return 'ApiTask[id=$id, name=$name, description=$description, templateIDs=$templateIDs, variableIDs=$variableIDs, createAt=$createAt, updateAt=$updateAt, ]';
  }

  ApiTask.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
    description = json['description'];
    templateIDs = (json['templateIDs'] == null) ?
      null :
      (json['templateIDs'] as List).cast<String>();
    variableIDs = (json['variableIDs'] == null) ?
      null :
      (json['variableIDs'] as List).cast<String>();
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
    if (templateIDs != null)
      json['templateIDs'] = templateIDs;
    if (variableIDs != null)
      json['variableIDs'] = variableIDs;
    if (createAt != null)
      json['createAt'] = createAt;
    if (updateAt != null)
      json['updateAt'] = updateAt;
    return json;
  }

  static List<ApiTask> listFromJson(List<dynamic> json) {
    return json == null ? List<ApiTask>() : json.map((value) => ApiTask.fromJson(value)).toList();
  }

  static Map<String, ApiTask> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ApiTask>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = ApiTask.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of ApiTask-objects as value to a dart map
  static Map<String, List<ApiTask>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<ApiTask>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = ApiTask.listFromJson(value);
       });
     }
     return map;
  }
}

