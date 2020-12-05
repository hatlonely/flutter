//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JobSub {
  /// Returns a new [JobSub] instance.
  JobSub({
    this.templateID,
    this.status,
    this.exitCode,
    this.stdout,
    this.stderr,
  });

  /// Returns a new [JobSub] instance and optionally import its values from
  /// [json] if it's non-null.
  JobSub.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      templateID = json['templateID'];
      status = json['status'];
      exitCode = json['exitCode'];
      stdout = json['stdout'];
      stderr = json['stderr'];
    }
  }

  
  String templateID;

  
  String status;

  
  int exitCode;

  
  String stdout;

  
  String stderr;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JobSub &&
     other.templateID == templateID &&
     other.status == status &&
     other.exitCode == exitCode &&
     other.stdout == stdout &&
     other.stderr == stderr;

  @override
  int get hashCode =>
    templateID.hashCode +
    status.hashCode +
    exitCode.hashCode +
    stdout.hashCode +
    stderr.hashCode;

  @override
  String toString() => 'JobSub[templateID=$templateID, status=$status, exitCode=$exitCode, stdout=$stdout, stderr=$stderr]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (templateID != null) {
      json['templateID'] = templateID;
    }
    if (status != null) {
      json['status'] = status;
    }
    if (exitCode != null) {
      json['exitCode'] = exitCode;
    }
    if (stdout != null) {
      json['stdout'] = stdout;
    }
    if (stderr != null) {
      json['stderr'] = stderr;
    }
    return json;
  }

  static List<JobSub> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <JobSub>[]
      : json.map((v) => JobSub.fromJson(v)).toList(growable: true == growable);

  static Map<String, JobSub> mapFromJson(Map<String, dynamic> json) {
    final map = <String, JobSub>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = JobSub.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of JobSub-objects as value to a dart map
  static Map<String, List<JobSub>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<JobSub>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = JobSub.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

