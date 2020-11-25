///
//  Generated code. Do not modify.
//  source: api/cicd.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'cicd.pb.dart' as $0;
export 'cicd.pb.dart';

class CICDServiceClient extends $grpc.Client {
  static final _$runTask = $grpc.ClientMethod<$0.RunTaskReq, $0.RunTaskRes>(
      '/api.CICDService/RunTask',
      ($0.RunTaskReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RunTaskRes.fromBuffer(value));
  static final _$getTask = $grpc.ClientMethod<$0.GetTaskReq, $0.Task>(
      '/api.CICDService/GetTask',
      ($0.GetTaskReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Task.fromBuffer(value));
  static final _$delTask = $grpc.ClientMethod<$0.DelTaskReq, $0.Empty>(
      '/api.CICDService/DelTask',
      ($0.DelTaskReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$putTask = $grpc.ClientMethod<$0.PutTaskReq, $0.Empty>(
      '/api.CICDService/PutTask',
      ($0.PutTaskReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$updateTask = $grpc.ClientMethod<$0.UpdateTaskReq, $0.Empty>(
      '/api.CICDService/UpdateTask',
      ($0.UpdateTaskReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$listTask = $grpc.ClientMethod<$0.ListTaskReq, $0.ListTaskRes>(
      '/api.CICDService/ListTask',
      ($0.ListTaskReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListTaskRes.fromBuffer(value));
  static final _$getTemplate =
      $grpc.ClientMethod<$0.GetTemplateReq, $0.Template>(
          '/api.CICDService/GetTemplate',
          ($0.GetTemplateReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Template.fromBuffer(value));
  static final _$delTemplate = $grpc.ClientMethod<$0.DelTemplateReq, $0.Empty>(
      '/api.CICDService/DelTemplate',
      ($0.DelTemplateReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$putTemplate = $grpc.ClientMethod<$0.PutTemplateReq, $0.Empty>(
      '/api.CICDService/PutTemplate',
      ($0.PutTemplateReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$updateTemplate =
      $grpc.ClientMethod<$0.UpdateTemplateReq, $0.Empty>(
          '/api.CICDService/UpdateTemplate',
          ($0.UpdateTemplateReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$listTemplate =
      $grpc.ClientMethod<$0.ListTemplateReq, $0.ListTemplateRes>(
          '/api.CICDService/ListTemplate',
          ($0.ListTemplateReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ListTemplateRes.fromBuffer(value));
  static final _$getVariable =
      $grpc.ClientMethod<$0.GetVariableReq, $0.Variable>(
          '/api.CICDService/GetVariable',
          ($0.GetVariableReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Variable.fromBuffer(value));
  static final _$delVariable = $grpc.ClientMethod<$0.DelVariableReq, $0.Empty>(
      '/api.CICDService/DelVariable',
      ($0.DelVariableReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$putVariable = $grpc.ClientMethod<$0.PutVariableReq, $0.Empty>(
      '/api.CICDService/PutVariable',
      ($0.PutVariableReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$updateVariable =
      $grpc.ClientMethod<$0.UpdateVariableReq, $0.Empty>(
          '/api.CICDService/UpdateVariable',
          ($0.UpdateVariableReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$listVariable =
      $grpc.ClientMethod<$0.ListVariableReq, $0.ListVariableRes>(
          '/api.CICDService/ListVariable',
          ($0.ListVariableReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ListVariableRes.fromBuffer(value));

  CICDServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.RunTaskRes> runTask($0.RunTaskReq request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$runTask, request, options: options);
  }

  $grpc.ResponseFuture<$0.Task> getTask($0.GetTaskReq request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$getTask, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> delTask($0.DelTaskReq request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$delTask, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> putTask($0.PutTaskReq request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$putTask, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> updateTask($0.UpdateTaskReq request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$updateTask, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListTaskRes> listTask($0.ListTaskReq request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$listTask, request, options: options);
  }

  $grpc.ResponseFuture<$0.Template> getTemplate($0.GetTemplateReq request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$getTemplate, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> delTemplate($0.DelTemplateReq request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$delTemplate, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> putTemplate($0.PutTemplateReq request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$putTemplate, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> updateTemplate($0.UpdateTemplateReq request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$updateTemplate, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListTemplateRes> listTemplate(
      $0.ListTemplateReq request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$listTemplate, request, options: options);
  }

  $grpc.ResponseFuture<$0.Variable> getVariable($0.GetVariableReq request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$getVariable, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> delVariable($0.DelVariableReq request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$delVariable, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> putVariable($0.PutVariableReq request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$putVariable, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> updateVariable($0.UpdateVariableReq request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$updateVariable, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListVariableRes> listVariable(
      $0.ListVariableReq request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$listVariable, request, options: options);
  }
}

abstract class CICDServiceBase extends $grpc.Service {
  $core.String get $name => 'api.CICDService';

  CICDServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.RunTaskReq, $0.RunTaskRes>(
        'RunTask',
        runTask_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RunTaskReq.fromBuffer(value),
        ($0.RunTaskRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetTaskReq, $0.Task>(
        'GetTask',
        getTask_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetTaskReq.fromBuffer(value),
        ($0.Task value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DelTaskReq, $0.Empty>(
        'DelTask',
        delTask_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DelTaskReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PutTaskReq, $0.Empty>(
        'PutTask',
        putTask_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PutTaskReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateTaskReq, $0.Empty>(
        'UpdateTask',
        updateTask_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateTaskReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListTaskReq, $0.ListTaskRes>(
        'ListTask',
        listTask_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListTaskReq.fromBuffer(value),
        ($0.ListTaskRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetTemplateReq, $0.Template>(
        'GetTemplate',
        getTemplate_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetTemplateReq.fromBuffer(value),
        ($0.Template value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DelTemplateReq, $0.Empty>(
        'DelTemplate',
        delTemplate_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DelTemplateReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PutTemplateReq, $0.Empty>(
        'PutTemplate',
        putTemplate_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PutTemplateReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateTemplateReq, $0.Empty>(
        'UpdateTemplate',
        updateTemplate_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateTemplateReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListTemplateReq, $0.ListTemplateRes>(
        'ListTemplate',
        listTemplate_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListTemplateReq.fromBuffer(value),
        ($0.ListTemplateRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetVariableReq, $0.Variable>(
        'GetVariable',
        getVariable_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetVariableReq.fromBuffer(value),
        ($0.Variable value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DelVariableReq, $0.Empty>(
        'DelVariable',
        delVariable_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DelVariableReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PutVariableReq, $0.Empty>(
        'PutVariable',
        putVariable_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PutVariableReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateVariableReq, $0.Empty>(
        'UpdateVariable',
        updateVariable_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateVariableReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListVariableReq, $0.ListVariableRes>(
        'ListVariable',
        listVariable_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListVariableReq.fromBuffer(value),
        ($0.ListVariableRes value) => value.writeToBuffer()));
  }

  $async.Future<$0.RunTaskRes> runTask_Pre(
      $grpc.ServiceCall call, $async.Future<$0.RunTaskReq> request) async {
    return runTask(call, await request);
  }

  $async.Future<$0.Task> getTask_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetTaskReq> request) async {
    return getTask(call, await request);
  }

  $async.Future<$0.Empty> delTask_Pre(
      $grpc.ServiceCall call, $async.Future<$0.DelTaskReq> request) async {
    return delTask(call, await request);
  }

  $async.Future<$0.Empty> putTask_Pre(
      $grpc.ServiceCall call, $async.Future<$0.PutTaskReq> request) async {
    return putTask(call, await request);
  }

  $async.Future<$0.Empty> updateTask_Pre(
      $grpc.ServiceCall call, $async.Future<$0.UpdateTaskReq> request) async {
    return updateTask(call, await request);
  }

  $async.Future<$0.ListTaskRes> listTask_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ListTaskReq> request) async {
    return listTask(call, await request);
  }

  $async.Future<$0.Template> getTemplate_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetTemplateReq> request) async {
    return getTemplate(call, await request);
  }

  $async.Future<$0.Empty> delTemplate_Pre(
      $grpc.ServiceCall call, $async.Future<$0.DelTemplateReq> request) async {
    return delTemplate(call, await request);
  }

  $async.Future<$0.Empty> putTemplate_Pre(
      $grpc.ServiceCall call, $async.Future<$0.PutTemplateReq> request) async {
    return putTemplate(call, await request);
  }

  $async.Future<$0.Empty> updateTemplate_Pre($grpc.ServiceCall call,
      $async.Future<$0.UpdateTemplateReq> request) async {
    return updateTemplate(call, await request);
  }

  $async.Future<$0.ListTemplateRes> listTemplate_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ListTemplateReq> request) async {
    return listTemplate(call, await request);
  }

  $async.Future<$0.Variable> getVariable_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetVariableReq> request) async {
    return getVariable(call, await request);
  }

  $async.Future<$0.Empty> delVariable_Pre(
      $grpc.ServiceCall call, $async.Future<$0.DelVariableReq> request) async {
    return delVariable(call, await request);
  }

  $async.Future<$0.Empty> putVariable_Pre(
      $grpc.ServiceCall call, $async.Future<$0.PutVariableReq> request) async {
    return putVariable(call, await request);
  }

  $async.Future<$0.Empty> updateVariable_Pre($grpc.ServiceCall call,
      $async.Future<$0.UpdateVariableReq> request) async {
    return updateVariable(call, await request);
  }

  $async.Future<$0.ListVariableRes> listVariable_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ListVariableReq> request) async {
    return listVariable(call, await request);
  }

  $async.Future<$0.RunTaskRes> runTask(
      $grpc.ServiceCall call, $0.RunTaskReq request);
  $async.Future<$0.Task> getTask($grpc.ServiceCall call, $0.GetTaskReq request);
  $async.Future<$0.Empty> delTask(
      $grpc.ServiceCall call, $0.DelTaskReq request);
  $async.Future<$0.Empty> putTask(
      $grpc.ServiceCall call, $0.PutTaskReq request);
  $async.Future<$0.Empty> updateTask(
      $grpc.ServiceCall call, $0.UpdateTaskReq request);
  $async.Future<$0.ListTaskRes> listTask(
      $grpc.ServiceCall call, $0.ListTaskReq request);
  $async.Future<$0.Template> getTemplate(
      $grpc.ServiceCall call, $0.GetTemplateReq request);
  $async.Future<$0.Empty> delTemplate(
      $grpc.ServiceCall call, $0.DelTemplateReq request);
  $async.Future<$0.Empty> putTemplate(
      $grpc.ServiceCall call, $0.PutTemplateReq request);
  $async.Future<$0.Empty> updateTemplate(
      $grpc.ServiceCall call, $0.UpdateTemplateReq request);
  $async.Future<$0.ListTemplateRes> listTemplate(
      $grpc.ServiceCall call, $0.ListTemplateReq request);
  $async.Future<$0.Variable> getVariable(
      $grpc.ServiceCall call, $0.GetVariableReq request);
  $async.Future<$0.Empty> delVariable(
      $grpc.ServiceCall call, $0.DelVariableReq request);
  $async.Future<$0.Empty> putVariable(
      $grpc.ServiceCall call, $0.PutVariableReq request);
  $async.Future<$0.Empty> updateVariable(
      $grpc.ServiceCall call, $0.UpdateVariableReq request);
  $async.Future<$0.ListVariableRes> listVariable(
      $grpc.ServiceCall call, $0.ListVariableReq request);
}
