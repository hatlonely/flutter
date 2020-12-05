//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RuntimeError {
  /// Returns a new [RuntimeError] instance.
  RuntimeError({
    this.error,
    this.code,
    this.message,
    this.details = const [],
  });

  /// Returns a new [RuntimeError] instance and optionally import its values from
  /// [json] if it's non-null.
  RuntimeError.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      error = json['error'];
      code = json['code'];
      message = json['message'];
      details = ProtobufAny.listFromJson(json['details']);
    }
  }

  
  String error;

  
  int code;

  
  String message;

  
  List<ProtobufAny> details;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RuntimeError &&
     other.error == error &&
     other.code == code &&
     other.message == message &&
     other.details == details;

  @override
  int get hashCode =>
    error.hashCode +
    code.hashCode +
    message.hashCode +
    details.hashCode;

  @override
  String toString() => 'RuntimeError[error=$error, code=$code, message=$message, details=$details]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (error != null) {
      json['error'] = error;
    }
    if (code != null) {
      json['code'] = code;
    }
    if (message != null) {
      json['message'] = message;
    }
    if (details != null) {
      json['details'] = details;
    }
    return json;
  }

  static List<RuntimeError> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <RuntimeError>[]
      : json.map((v) => RuntimeError.fromJson(v)).toList(growable: true == growable);

  static Map<String, RuntimeError> mapFromJson(Map<String, dynamic> json) {
    final map = <String, RuntimeError>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = RuntimeError.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of RuntimeError-objects as value to a dart map
  static Map<String, List<RuntimeError>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<RuntimeError>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = RuntimeError.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

