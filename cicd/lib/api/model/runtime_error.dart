part of swagger.api;

class RuntimeError {
  
  String error = null;
  

  int code = null;
  

  String message = null;
  

  List<ProtobufAny> details = [];
  
  RuntimeError();

  @override
  String toString() {
    return 'RuntimeError[error=$error, code=$code, message=$message, details=$details, ]';
  }

  RuntimeError.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    error =
        json['error']
    ;
    code =
        json['code']
    ;
    message =
        json['message']
    ;
    details =
      ProtobufAny.listFromJson(json['details'])
;
  }

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'code': code,
      'message': message,
      'details': details
     };
  }

  static List<RuntimeError> listFromJson(List<dynamic> json) {
    return json == null ? new List<RuntimeError>() : json.map((value) => new RuntimeError.fromJson(value)).toList();
  }

  static Map<String, RuntimeError> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, RuntimeError>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new RuntimeError.fromJson(value));
    }
    return map;
  }
}

