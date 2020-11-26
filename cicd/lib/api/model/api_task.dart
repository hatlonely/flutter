part of swagger.api;

class ApiTask {
  
  String id = null;
  

  String name = null;
  

  String description = null;
  

  List<String> templateIDs = [];
  

  List<String> variableIDs = [];
  
  ApiTask();

  @override
  String toString() {
    return 'ApiTask[id=$id, name=$name, description=$description, templateIDs=$templateIDs, variableIDs=$variableIDs, ]';
  }

  ApiTask.fromJson(Map<String, dynamic> json) {
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
    templateIDs =
        (json['templateIDs'] as List).map((item) => item as String).toList()
    ;
    variableIDs =
        (json['variableIDs'] as List).map((item) => item as String).toList()
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'templateIDs': templateIDs,
      'variableIDs': variableIDs
     };
  }

  static List<ApiTask> listFromJson(List<dynamic> json) {
    return json == null ? new List<ApiTask>() : json.map((value) => new ApiTask.fromJson(value)).toList();
  }

  static Map<String, ApiTask> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ApiTask>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ApiTask.fromJson(value));
    }
    return map;
  }
}

