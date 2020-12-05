//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ApiJob {
  /// Returns a new [ApiJob] instance.
  ApiJob({
    this.id,
    this.taskID,
    this.status,
    this.error,
    this.subs = const [],
    this.createAt,
    this.updateAt,
  });

  /// Returns a new [ApiJob] instance and optionally import its values from
  /// [json] if it's non-null.
  ApiJob.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      id = json['id'];
      taskID = json['taskID'];
      status = json['status'];
      error = json['error'];
      subs = JobSub.listFromJson(json['subs']);
      createAt = json['createAt'];
      updateAt = json['updateAt'];
    }
  }

  
  String id;

  
  String taskID;

  
  String status;

  
  String error;

  
  List<JobSub> subs;

  
  int createAt;

  
  int updateAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ApiJob &&
     other.id == id &&
     other.taskID == taskID &&
     other.status == status &&
     other.error == error &&
     other.subs == subs &&
     other.createAt == createAt &&
     other.updateAt == updateAt;

  @override
  int get hashCode =>
    id.hashCode +
    taskID.hashCode +
    status.hashCode +
    error.hashCode +
    subs.hashCode +
    createAt.hashCode +
    updateAt.hashCode;

  @override
  String toString() => 'ApiJob[id=$id, taskID=$taskID, status=$status, error=$error, subs=$subs, createAt=$createAt, updateAt=$updateAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json['id'] = id;
    }
    if (taskID != null) {
      json['taskID'] = taskID;
    }
    if (status != null) {
      json['status'] = status;
    }
    if (error != null) {
      json['error'] = error;
    }
    if (subs != null) {
      json['subs'] = subs;
    }
    if (createAt != null) {
      json['createAt'] = createAt;
    }
    if (updateAt != null) {
      json['updateAt'] = updateAt;
    }
    return json;
  }

  static List<ApiJob> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <ApiJob>[]
      : json.map((v) => ApiJob.fromJson(v)).toList(growable: true == growable);

  static Map<String, ApiJob> mapFromJson(Map<String, dynamic> json) {
    final map = <String, ApiJob>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = ApiJob.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of ApiJob-objects as value to a dart map
  static Map<String, List<ApiJob>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<ApiJob>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = ApiJob.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

