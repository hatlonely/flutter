//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProtobufAny {
  /// Returns a new [ProtobufAny] instance.
  ProtobufAny({
    this.typeUrl,
    this.value,
  });

  /// Returns a new [ProtobufAny] instance and optionally import its values from
  /// [json] if it's non-null.
  ProtobufAny.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      typeUrl = json['type_url'];
      value = json['value'];
    }
  }

  
  String typeUrl;

  
  String value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProtobufAny &&
     other.typeUrl == typeUrl &&
     other.value == value;

  @override
  int get hashCode =>
    typeUrl.hashCode +
    value.hashCode;

  @override
  String toString() => 'ProtobufAny[typeUrl=$typeUrl, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (typeUrl != null) {
      json['type_url'] = typeUrl;
    }
    if (value != null) {
      json['value'] = value;
    }
    return json;
  }

  static List<ProtobufAny> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <ProtobufAny>[]
      : json.map((v) => ProtobufAny.fromJson(v)).toList(growable: true == growable);

  static Map<String, ProtobufAny> mapFromJson(Map<String, dynamic> json) {
    final map = <String, ProtobufAny>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = ProtobufAny.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of ProtobufAny-objects as value to a dart map
  static Map<String, List<ProtobufAny>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<ProtobufAny>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = ProtobufAny.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

