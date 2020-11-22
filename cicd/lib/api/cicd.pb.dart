///
//  Generated code. Do not modify.
//  source: api/cicd.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class Empty extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Empty', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  Empty._() : super();
  factory Empty() => create();
  factory Empty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Empty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Empty clone() => Empty()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Empty copyWith(void Function(Empty) updates) => super.copyWith((message) => updates(message as Empty)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  Empty createEmptyInstance() => create();
  static $pb.PbList<Empty> createRepeated() => $pb.PbList<Empty>();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty _defaultInstance;
}

class ScriptTemplate extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ScriptTemplate', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'language')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'script')
    ..hasRequiredFields = false
  ;

  ScriptTemplate._() : super();
  factory ScriptTemplate() => create();
  factory ScriptTemplate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ScriptTemplate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ScriptTemplate clone() => ScriptTemplate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ScriptTemplate copyWith(void Function(ScriptTemplate) updates) => super.copyWith((message) => updates(message as ScriptTemplate)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScriptTemplate create() => ScriptTemplate._();
  ScriptTemplate createEmptyInstance() => create();
  static $pb.PbList<ScriptTemplate> createRepeated() => $pb.PbList<ScriptTemplate>();
  @$core.pragma('dart2js:noInline')
  static ScriptTemplate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ScriptTemplate>(create);
  static ScriptTemplate _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get language => $_getSZ(0);
  @$pb.TagNumber(1)
  set language($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLanguage() => $_has(0);
  @$pb.TagNumber(1)
  void clearLanguage() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get script => $_getSZ(1);
  @$pb.TagNumber(2)
  set script($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasScript() => $_has(1);
  @$pb.TagNumber(2)
  void clearScript() => clearField(2);
}

class Template extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Template', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'category')
    ..aOM<ScriptTemplate>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'scriptTemplate', protoName: 'scriptTemplate', subBuilder: ScriptTemplate.create)
    ..hasRequiredFields = false
  ;

  Template._() : super();
  factory Template() => create();
  factory Template.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Template.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Template clone() => Template()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Template copyWith(void Function(Template) updates) => super.copyWith((message) => updates(message as Template)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Template create() => Template._();
  Template createEmptyInstance() => create();
  static $pb.PbList<Template> createRepeated() => $pb.PbList<Template>();
  @$core.pragma('dart2js:noInline')
  static Template getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Template>(create);
  static Template _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get type => $_getSZ(3);
  @$pb.TagNumber(4)
  set type($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get category => $_getSZ(4);
  @$pb.TagNumber(5)
  set category($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCategory() => $_has(4);
  @$pb.TagNumber(5)
  void clearCategory() => clearField(5);

  @$pb.TagNumber(6)
  ScriptTemplate get scriptTemplate => $_getN(5);
  @$pb.TagNumber(6)
  set scriptTemplate(ScriptTemplate v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasScriptTemplate() => $_has(5);
  @$pb.TagNumber(6)
  void clearScriptTemplate() => clearField(6);
  @$pb.TagNumber(6)
  ScriptTemplate ensureScriptTemplate() => $_ensure(5);
}

class GetTemplateReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetTemplateReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  GetTemplateReq._() : super();
  factory GetTemplateReq() => create();
  factory GetTemplateReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTemplateReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTemplateReq clone() => GetTemplateReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTemplateReq copyWith(void Function(GetTemplateReq) updates) => super.copyWith((message) => updates(message as GetTemplateReq)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetTemplateReq create() => GetTemplateReq._();
  GetTemplateReq createEmptyInstance() => create();
  static $pb.PbList<GetTemplateReq> createRepeated() => $pb.PbList<GetTemplateReq>();
  @$core.pragma('dart2js:noInline')
  static GetTemplateReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTemplateReq>(create);
  static GetTemplateReq _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class DelTemplateReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DelTemplateReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  DelTemplateReq._() : super();
  factory DelTemplateReq() => create();
  factory DelTemplateReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DelTemplateReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DelTemplateReq clone() => DelTemplateReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DelTemplateReq copyWith(void Function(DelTemplateReq) updates) => super.copyWith((message) => updates(message as DelTemplateReq)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DelTemplateReq create() => DelTemplateReq._();
  DelTemplateReq createEmptyInstance() => create();
  static $pb.PbList<DelTemplateReq> createRepeated() => $pb.PbList<DelTemplateReq>();
  @$core.pragma('dart2js:noInline')
  static DelTemplateReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DelTemplateReq>(create);
  static DelTemplateReq _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class PutTemplateReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PutTemplateReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..aOM<Template>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'template', subBuilder: Template.create)
    ..hasRequiredFields = false
  ;

  PutTemplateReq._() : super();
  factory PutTemplateReq() => create();
  factory PutTemplateReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PutTemplateReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PutTemplateReq clone() => PutTemplateReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PutTemplateReq copyWith(void Function(PutTemplateReq) updates) => super.copyWith((message) => updates(message as PutTemplateReq)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PutTemplateReq create() => PutTemplateReq._();
  PutTemplateReq createEmptyInstance() => create();
  static $pb.PbList<PutTemplateReq> createRepeated() => $pb.PbList<PutTemplateReq>();
  @$core.pragma('dart2js:noInline')
  static PutTemplateReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PutTemplateReq>(create);
  static PutTemplateReq _defaultInstance;

  @$pb.TagNumber(1)
  Template get template => $_getN(0);
  @$pb.TagNumber(1)
  set template(Template v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTemplate() => $_has(0);
  @$pb.TagNumber(1)
  void clearTemplate() => clearField(1);
  @$pb.TagNumber(1)
  Template ensureTemplate() => $_ensure(0);
}

class UpdateTemplateReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateTemplateReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..aOM<Template>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'template', subBuilder: Template.create)
    ..hasRequiredFields = false
  ;

  UpdateTemplateReq._() : super();
  factory UpdateTemplateReq() => create();
  factory UpdateTemplateReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateTemplateReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateTemplateReq clone() => UpdateTemplateReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateTemplateReq copyWith(void Function(UpdateTemplateReq) updates) => super.copyWith((message) => updates(message as UpdateTemplateReq)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateTemplateReq create() => UpdateTemplateReq._();
  UpdateTemplateReq createEmptyInstance() => create();
  static $pb.PbList<UpdateTemplateReq> createRepeated() => $pb.PbList<UpdateTemplateReq>();
  @$core.pragma('dart2js:noInline')
  static UpdateTemplateReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateTemplateReq>(create);
  static UpdateTemplateReq _defaultInstance;

  @$pb.TagNumber(1)
  Template get template => $_getN(0);
  @$pb.TagNumber(1)
  set template(Template v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTemplate() => $_has(0);
  @$pb.TagNumber(1)
  void clearTemplate() => clearField(1);
  @$pb.TagNumber(1)
  Template ensureTemplate() => $_ensure(0);
}

class ListTemplateReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListTemplateReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'offset')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'limit')
    ..hasRequiredFields = false
  ;

  ListTemplateReq._() : super();
  factory ListTemplateReq() => create();
  factory ListTemplateReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListTemplateReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListTemplateReq clone() => ListTemplateReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListTemplateReq copyWith(void Function(ListTemplateReq) updates) => super.copyWith((message) => updates(message as ListTemplateReq)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListTemplateReq create() => ListTemplateReq._();
  ListTemplateReq createEmptyInstance() => create();
  static $pb.PbList<ListTemplateReq> createRepeated() => $pb.PbList<ListTemplateReq>();
  @$core.pragma('dart2js:noInline')
  static ListTemplateReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListTemplateReq>(create);
  static ListTemplateReq _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get offset => $_getI64(0);
  @$pb.TagNumber(1)
  set offset($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOffset() => $_has(0);
  @$pb.TagNumber(1)
  void clearOffset() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get limit => $_getI64(1);
  @$pb.TagNumber(2)
  set limit($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => clearField(2);
}

class ListTemplateRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListTemplateRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..pc<Template>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'templates', $pb.PbFieldType.PM, subBuilder: Template.create)
    ..hasRequiredFields = false
  ;

  ListTemplateRes._() : super();
  factory ListTemplateRes() => create();
  factory ListTemplateRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListTemplateRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListTemplateRes clone() => ListTemplateRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListTemplateRes copyWith(void Function(ListTemplateRes) updates) => super.copyWith((message) => updates(message as ListTemplateRes)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListTemplateRes create() => ListTemplateRes._();
  ListTemplateRes createEmptyInstance() => create();
  static $pb.PbList<ListTemplateRes> createRepeated() => $pb.PbList<ListTemplateRes>();
  @$core.pragma('dart2js:noInline')
  static ListTemplateRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListTemplateRes>(create);
  static ListTemplateRes _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Template> get templates => $_getList(0);
}

class Variable extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Variable', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'kvs')
    ..hasRequiredFields = false
  ;

  Variable._() : super();
  factory Variable() => create();
  factory Variable.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Variable.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Variable clone() => Variable()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Variable copyWith(void Function(Variable) updates) => super.copyWith((message) => updates(message as Variable)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Variable create() => Variable._();
  Variable createEmptyInstance() => create();
  static $pb.PbList<Variable> createRepeated() => $pb.PbList<Variable>();
  @$core.pragma('dart2js:noInline')
  static Variable getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Variable>(create);
  static Variable _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get kvs => $_getSZ(3);
  @$pb.TagNumber(4)
  set kvs($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasKvs() => $_has(3);
  @$pb.TagNumber(4)
  void clearKvs() => clearField(4);
}

class GetVariableReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetVariableReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  GetVariableReq._() : super();
  factory GetVariableReq() => create();
  factory GetVariableReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetVariableReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetVariableReq clone() => GetVariableReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetVariableReq copyWith(void Function(GetVariableReq) updates) => super.copyWith((message) => updates(message as GetVariableReq)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetVariableReq create() => GetVariableReq._();
  GetVariableReq createEmptyInstance() => create();
  static $pb.PbList<GetVariableReq> createRepeated() => $pb.PbList<GetVariableReq>();
  @$core.pragma('dart2js:noInline')
  static GetVariableReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetVariableReq>(create);
  static GetVariableReq _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class DelVariableReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DelVariableReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  DelVariableReq._() : super();
  factory DelVariableReq() => create();
  factory DelVariableReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DelVariableReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DelVariableReq clone() => DelVariableReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DelVariableReq copyWith(void Function(DelVariableReq) updates) => super.copyWith((message) => updates(message as DelVariableReq)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DelVariableReq create() => DelVariableReq._();
  DelVariableReq createEmptyInstance() => create();
  static $pb.PbList<DelVariableReq> createRepeated() => $pb.PbList<DelVariableReq>();
  @$core.pragma('dart2js:noInline')
  static DelVariableReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DelVariableReq>(create);
  static DelVariableReq _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class PutVariableReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PutVariableReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..aOM<Variable>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'variable', subBuilder: Variable.create)
    ..hasRequiredFields = false
  ;

  PutVariableReq._() : super();
  factory PutVariableReq() => create();
  factory PutVariableReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PutVariableReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PutVariableReq clone() => PutVariableReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PutVariableReq copyWith(void Function(PutVariableReq) updates) => super.copyWith((message) => updates(message as PutVariableReq)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PutVariableReq create() => PutVariableReq._();
  PutVariableReq createEmptyInstance() => create();
  static $pb.PbList<PutVariableReq> createRepeated() => $pb.PbList<PutVariableReq>();
  @$core.pragma('dart2js:noInline')
  static PutVariableReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PutVariableReq>(create);
  static PutVariableReq _defaultInstance;

  @$pb.TagNumber(1)
  Variable get variable => $_getN(0);
  @$pb.TagNumber(1)
  set variable(Variable v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasVariable() => $_has(0);
  @$pb.TagNumber(1)
  void clearVariable() => clearField(1);
  @$pb.TagNumber(1)
  Variable ensureVariable() => $_ensure(0);
}

class UpdateVariableReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateVariableReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..aOM<Variable>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'variable', subBuilder: Variable.create)
    ..hasRequiredFields = false
  ;

  UpdateVariableReq._() : super();
  factory UpdateVariableReq() => create();
  factory UpdateVariableReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateVariableReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateVariableReq clone() => UpdateVariableReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateVariableReq copyWith(void Function(UpdateVariableReq) updates) => super.copyWith((message) => updates(message as UpdateVariableReq)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateVariableReq create() => UpdateVariableReq._();
  UpdateVariableReq createEmptyInstance() => create();
  static $pb.PbList<UpdateVariableReq> createRepeated() => $pb.PbList<UpdateVariableReq>();
  @$core.pragma('dart2js:noInline')
  static UpdateVariableReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateVariableReq>(create);
  static UpdateVariableReq _defaultInstance;

  @$pb.TagNumber(1)
  Variable get variable => $_getN(0);
  @$pb.TagNumber(1)
  set variable(Variable v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasVariable() => $_has(0);
  @$pb.TagNumber(1)
  void clearVariable() => clearField(1);
  @$pb.TagNumber(1)
  Variable ensureVariable() => $_ensure(0);
}

class ListVariableReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListVariableReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'offset')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'limit')
    ..hasRequiredFields = false
  ;

  ListVariableReq._() : super();
  factory ListVariableReq() => create();
  factory ListVariableReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListVariableReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListVariableReq clone() => ListVariableReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListVariableReq copyWith(void Function(ListVariableReq) updates) => super.copyWith((message) => updates(message as ListVariableReq)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListVariableReq create() => ListVariableReq._();
  ListVariableReq createEmptyInstance() => create();
  static $pb.PbList<ListVariableReq> createRepeated() => $pb.PbList<ListVariableReq>();
  @$core.pragma('dart2js:noInline')
  static ListVariableReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListVariableReq>(create);
  static ListVariableReq _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get offset => $_getI64(0);
  @$pb.TagNumber(1)
  set offset($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOffset() => $_has(0);
  @$pb.TagNumber(1)
  void clearOffset() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get limit => $_getI64(1);
  @$pb.TagNumber(2)
  set limit($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => clearField(2);
}

class ListVariableRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListVariableRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..pc<Variable>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'variables', $pb.PbFieldType.PM, subBuilder: Variable.create)
    ..hasRequiredFields = false
  ;

  ListVariableRes._() : super();
  factory ListVariableRes() => create();
  factory ListVariableRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListVariableRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListVariableRes clone() => ListVariableRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListVariableRes copyWith(void Function(ListVariableRes) updates) => super.copyWith((message) => updates(message as ListVariableRes)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListVariableRes create() => ListVariableRes._();
  ListVariableRes createEmptyInstance() => create();
  static $pb.PbList<ListVariableRes> createRepeated() => $pb.PbList<ListVariableRes>();
  @$core.pragma('dart2js:noInline')
  static ListVariableRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListVariableRes>(create);
  static ListVariableRes _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Variable> get variables => $_getList(0);
}

class Task extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Task', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'templateID', protoName: 'templateID')
    ..pPS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'variableIDs', protoName: 'variableIDs')
    ..hasRequiredFields = false
  ;

  Task._() : super();
  factory Task() => create();
  factory Task.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Task.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Task clone() => Task()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Task copyWith(void Function(Task) updates) => super.copyWith((message) => updates(message as Task)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Task create() => Task._();
  Task createEmptyInstance() => create();
  static $pb.PbList<Task> createRepeated() => $pb.PbList<Task>();
  @$core.pragma('dart2js:noInline')
  static Task getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Task>(create);
  static Task _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get templateID => $_getSZ(3);
  @$pb.TagNumber(4)
  set templateID($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTemplateID() => $_has(3);
  @$pb.TagNumber(4)
  void clearTemplateID() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.String> get variableIDs => $_getList(4);
}

class GetTaskReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetTaskReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  GetTaskReq._() : super();
  factory GetTaskReq() => create();
  factory GetTaskReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTaskReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTaskReq clone() => GetTaskReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTaskReq copyWith(void Function(GetTaskReq) updates) => super.copyWith((message) => updates(message as GetTaskReq)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetTaskReq create() => GetTaskReq._();
  GetTaskReq createEmptyInstance() => create();
  static $pb.PbList<GetTaskReq> createRepeated() => $pb.PbList<GetTaskReq>();
  @$core.pragma('dart2js:noInline')
  static GetTaskReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTaskReq>(create);
  static GetTaskReq _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class DelTaskReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DelTaskReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  DelTaskReq._() : super();
  factory DelTaskReq() => create();
  factory DelTaskReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DelTaskReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DelTaskReq clone() => DelTaskReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DelTaskReq copyWith(void Function(DelTaskReq) updates) => super.copyWith((message) => updates(message as DelTaskReq)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DelTaskReq create() => DelTaskReq._();
  DelTaskReq createEmptyInstance() => create();
  static $pb.PbList<DelTaskReq> createRepeated() => $pb.PbList<DelTaskReq>();
  @$core.pragma('dart2js:noInline')
  static DelTaskReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DelTaskReq>(create);
  static DelTaskReq _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class PutTaskReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PutTaskReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..aOM<Task>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'task', subBuilder: Task.create)
    ..hasRequiredFields = false
  ;

  PutTaskReq._() : super();
  factory PutTaskReq() => create();
  factory PutTaskReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PutTaskReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PutTaskReq clone() => PutTaskReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PutTaskReq copyWith(void Function(PutTaskReq) updates) => super.copyWith((message) => updates(message as PutTaskReq)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PutTaskReq create() => PutTaskReq._();
  PutTaskReq createEmptyInstance() => create();
  static $pb.PbList<PutTaskReq> createRepeated() => $pb.PbList<PutTaskReq>();
  @$core.pragma('dart2js:noInline')
  static PutTaskReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PutTaskReq>(create);
  static PutTaskReq _defaultInstance;

  @$pb.TagNumber(1)
  Task get task => $_getN(0);
  @$pb.TagNumber(1)
  set task(Task v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTask() => $_has(0);
  @$pb.TagNumber(1)
  void clearTask() => clearField(1);
  @$pb.TagNumber(1)
  Task ensureTask() => $_ensure(0);
}

class UpdateTaskReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateTaskReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..aOM<Task>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'task', subBuilder: Task.create)
    ..hasRequiredFields = false
  ;

  UpdateTaskReq._() : super();
  factory UpdateTaskReq() => create();
  factory UpdateTaskReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateTaskReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateTaskReq clone() => UpdateTaskReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateTaskReq copyWith(void Function(UpdateTaskReq) updates) => super.copyWith((message) => updates(message as UpdateTaskReq)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateTaskReq create() => UpdateTaskReq._();
  UpdateTaskReq createEmptyInstance() => create();
  static $pb.PbList<UpdateTaskReq> createRepeated() => $pb.PbList<UpdateTaskReq>();
  @$core.pragma('dart2js:noInline')
  static UpdateTaskReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateTaskReq>(create);
  static UpdateTaskReq _defaultInstance;

  @$pb.TagNumber(1)
  Task get task => $_getN(0);
  @$pb.TagNumber(1)
  set task(Task v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTask() => $_has(0);
  @$pb.TagNumber(1)
  void clearTask() => clearField(1);
  @$pb.TagNumber(1)
  Task ensureTask() => $_ensure(0);
}

class ListTaskReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListTaskReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'offset')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'limit')
    ..hasRequiredFields = false
  ;

  ListTaskReq._() : super();
  factory ListTaskReq() => create();
  factory ListTaskReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListTaskReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListTaskReq clone() => ListTaskReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListTaskReq copyWith(void Function(ListTaskReq) updates) => super.copyWith((message) => updates(message as ListTaskReq)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListTaskReq create() => ListTaskReq._();
  ListTaskReq createEmptyInstance() => create();
  static $pb.PbList<ListTaskReq> createRepeated() => $pb.PbList<ListTaskReq>();
  @$core.pragma('dart2js:noInline')
  static ListTaskReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListTaskReq>(create);
  static ListTaskReq _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get offset => $_getI64(0);
  @$pb.TagNumber(1)
  set offset($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOffset() => $_has(0);
  @$pb.TagNumber(1)
  void clearOffset() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get limit => $_getI64(1);
  @$pb.TagNumber(2)
  set limit($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => clearField(2);
}

class ListTaskRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListTaskRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..pc<Task>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tasks', $pb.PbFieldType.PM, subBuilder: Task.create)
    ..hasRequiredFields = false
  ;

  ListTaskRes._() : super();
  factory ListTaskRes() => create();
  factory ListTaskRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListTaskRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListTaskRes clone() => ListTaskRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListTaskRes copyWith(void Function(ListTaskRes) updates) => super.copyWith((message) => updates(message as ListTaskRes)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListTaskRes create() => ListTaskRes._();
  ListTaskRes createEmptyInstance() => create();
  static $pb.PbList<ListTaskRes> createRepeated() => $pb.PbList<ListTaskRes>();
  @$core.pragma('dart2js:noInline')
  static ListTaskRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListTaskRes>(create);
  static ListTaskRes _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Task> get tasks => $_getList(0);
}

class RunTaskReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RunTaskReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'taskID', protoName: 'taskID')
    ..hasRequiredFields = false
  ;

  RunTaskReq._() : super();
  factory RunTaskReq() => create();
  factory RunTaskReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RunTaskReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RunTaskReq clone() => RunTaskReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RunTaskReq copyWith(void Function(RunTaskReq) updates) => super.copyWith((message) => updates(message as RunTaskReq)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RunTaskReq create() => RunTaskReq._();
  RunTaskReq createEmptyInstance() => create();
  static $pb.PbList<RunTaskReq> createRepeated() => $pb.PbList<RunTaskReq>();
  @$core.pragma('dart2js:noInline')
  static RunTaskReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RunTaskReq>(create);
  static RunTaskReq _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get taskID => $_getSZ(0);
  @$pb.TagNumber(1)
  set taskID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTaskID() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskID() => clearField(1);
}

class RunTaskRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RunTaskRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'jobID', protoName: 'jobID')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'exitCode', protoName: 'exitCode')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'stdout')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'stderr')
    ..hasRequiredFields = false
  ;

  RunTaskRes._() : super();
  factory RunTaskRes() => create();
  factory RunTaskRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RunTaskRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RunTaskRes clone() => RunTaskRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RunTaskRes copyWith(void Function(RunTaskRes) updates) => super.copyWith((message) => updates(message as RunTaskRes)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RunTaskRes create() => RunTaskRes._();
  RunTaskRes createEmptyInstance() => create();
  static $pb.PbList<RunTaskRes> createRepeated() => $pb.PbList<RunTaskRes>();
  @$core.pragma('dart2js:noInline')
  static RunTaskRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RunTaskRes>(create);
  static RunTaskRes _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get jobID => $_getSZ(0);
  @$pb.TagNumber(1)
  set jobID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasJobID() => $_has(0);
  @$pb.TagNumber(1)
  void clearJobID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get exitCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set exitCode($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasExitCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearExitCode() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get stdout => $_getSZ(2);
  @$pb.TagNumber(3)
  set stdout($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStdout() => $_has(2);
  @$pb.TagNumber(3)
  void clearStdout() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get stderr => $_getSZ(3);
  @$pb.TagNumber(4)
  set stderr($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasStderr() => $_has(3);
  @$pb.TagNumber(4)
  void clearStderr() => clearField(4);
}

class CICDServiceApi {
  $pb.RpcClient _client;
  CICDServiceApi(this._client);

  $async.Future<RunTaskRes> runTask($pb.ClientContext ctx, RunTaskReq request) {
    var emptyResponse = RunTaskRes();
    return _client.invoke<RunTaskRes>(ctx, 'CICDService', 'RunTask', request, emptyResponse);
  }
  $async.Future<Task> getTask($pb.ClientContext ctx, GetTaskReq request) {
    var emptyResponse = Task();
    return _client.invoke<Task>(ctx, 'CICDService', 'GetTask', request, emptyResponse);
  }
  $async.Future<Empty> delTask($pb.ClientContext ctx, DelTaskReq request) {
    var emptyResponse = Empty();
    return _client.invoke<Empty>(ctx, 'CICDService', 'DelTask', request, emptyResponse);
  }
  $async.Future<Empty> putTask($pb.ClientContext ctx, PutTaskReq request) {
    var emptyResponse = Empty();
    return _client.invoke<Empty>(ctx, 'CICDService', 'PutTask', request, emptyResponse);
  }
  $async.Future<Empty> updateTask($pb.ClientContext ctx, UpdateTaskReq request) {
    var emptyResponse = Empty();
    return _client.invoke<Empty>(ctx, 'CICDService', 'UpdateTask', request, emptyResponse);
  }
  $async.Future<ListTaskRes> listTask($pb.ClientContext ctx, ListTaskReq request) {
    var emptyResponse = ListTaskRes();
    return _client.invoke<ListTaskRes>(ctx, 'CICDService', 'ListTask', request, emptyResponse);
  }
  $async.Future<Template> getTemplate($pb.ClientContext ctx, GetTemplateReq request) {
    var emptyResponse = Template();
    return _client.invoke<Template>(ctx, 'CICDService', 'GetTemplate', request, emptyResponse);
  }
  $async.Future<Empty> delTemplate($pb.ClientContext ctx, DelTemplateReq request) {
    var emptyResponse = Empty();
    return _client.invoke<Empty>(ctx, 'CICDService', 'DelTemplate', request, emptyResponse);
  }
  $async.Future<Empty> putTemplate($pb.ClientContext ctx, PutTemplateReq request) {
    var emptyResponse = Empty();
    return _client.invoke<Empty>(ctx, 'CICDService', 'PutTemplate', request, emptyResponse);
  }
  $async.Future<Empty> updateTemplate($pb.ClientContext ctx, UpdateTemplateReq request) {
    var emptyResponse = Empty();
    return _client.invoke<Empty>(ctx, 'CICDService', 'UpdateTemplate', request, emptyResponse);
  }
  $async.Future<ListTemplateRes> listTemplate($pb.ClientContext ctx, ListTemplateReq request) {
    var emptyResponse = ListTemplateRes();
    return _client.invoke<ListTemplateRes>(ctx, 'CICDService', 'ListTemplate', request, emptyResponse);
  }
  $async.Future<Variable> getVariable($pb.ClientContext ctx, GetVariableReq request) {
    var emptyResponse = Variable();
    return _client.invoke<Variable>(ctx, 'CICDService', 'GetVariable', request, emptyResponse);
  }
  $async.Future<Empty> delVariable($pb.ClientContext ctx, DelVariableReq request) {
    var emptyResponse = Empty();
    return _client.invoke<Empty>(ctx, 'CICDService', 'DelVariable', request, emptyResponse);
  }
  $async.Future<Empty> putVariable($pb.ClientContext ctx, PutVariableReq request) {
    var emptyResponse = Empty();
    return _client.invoke<Empty>(ctx, 'CICDService', 'PutVariable', request, emptyResponse);
  }
  $async.Future<Empty> updateVariable($pb.ClientContext ctx, UpdateVariableReq request) {
    var emptyResponse = Empty();
    return _client.invoke<Empty>(ctx, 'CICDService', 'UpdateVariable', request, emptyResponse);
  }
  $async.Future<ListVariableRes> listVariable($pb.ClientContext ctx, ListVariableReq request) {
    var emptyResponse = ListVariableRes();
    return _client.invoke<ListVariableRes>(ctx, 'CICDService', 'ListVariable', request, emptyResponse);
  }
}

