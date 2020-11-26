part of swagger.api;

class ProtobufAny {
  
  String typeUrl = null;
  

  String value = null;
  
  ProtobufAny();

  @override
  String toString() {
    return 'ProtobufAny[typeUrl=$typeUrl, value=$value, ]';
  }

  ProtobufAny.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    typeUrl =
        json['type_url']
    ;
    value =
        json['value']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'type_url': typeUrl,
      'value': value
     };
  }

  static List<ProtobufAny> listFromJson(List<dynamic> json) {
    return json == null ? new List<ProtobufAny>() : json.map((value) => new ProtobufAny.fromJson(value)).toList();
  }

  static Map<String, ProtobufAny> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ProtobufAny>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ProtobufAny.fromJson(value));
    }
    return map;
  }
}

