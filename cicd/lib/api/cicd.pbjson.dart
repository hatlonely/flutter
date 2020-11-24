///
//  Generated code. Do not modify.
//  source: api/cicd.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

const Empty$json = const {
  '1': 'Empty',
};

const Template$json = const {
  '1': 'Template',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '8': const {}, '10': 'name'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '8': const {}, '10': 'description'},
    const {'1': 'type', '3': 4, '4': 1, '5': 9, '8': const {}, '10': 'type'},
    const {'1': 'category', '3': 5, '4': 1, '5': 9, '8': const {}, '10': 'category'},
    const {'1': 'scriptTemplate', '3': 6, '4': 1, '5': 11, '6': '.api.Template.ScriptTemplate', '8': const {}, '10': 'scriptTemplate'},
  ],
  '3': const [Template_ScriptTemplate$json],
};

const Template_ScriptTemplate$json = const {
  '1': 'ScriptTemplate',
  '2': const [
    const {'1': 'language', '3': 1, '4': 1, '5': 9, '10': 'language'},
    const {'1': 'script', '3': 2, '4': 1, '5': 9, '10': 'script'},
  ],
};

const GetTemplateReq$json = const {
  '1': 'GetTemplateReq',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

const DelTemplateReq$json = const {
  '1': 'DelTemplateReq',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

const PutTemplateReq$json = const {
  '1': 'PutTemplateReq',
  '2': const [
    const {'1': 'template', '3': 1, '4': 1, '5': 11, '6': '.api.Template', '10': 'template'},
  ],
};

const UpdateTemplateReq$json = const {
  '1': 'UpdateTemplateReq',
  '2': const [
    const {'1': 'template', '3': 1, '4': 1, '5': 11, '6': '.api.Template', '10': 'template'},
  ],
};

const ListTemplateReq$json = const {
  '1': 'ListTemplateReq',
  '2': const [
    const {'1': 'offset', '3': 1, '4': 1, '5': 3, '10': 'offset'},
    const {'1': 'limit', '3': 2, '4': 1, '5': 3, '10': 'limit'},
    const {'1': 'brief', '3': 3, '4': 1, '5': 8, '10': 'brief'},
  ],
};

const ListTemplateRes$json = const {
  '1': 'ListTemplateRes',
  '2': const [
    const {'1': 'templates', '3': 1, '4': 3, '5': 11, '6': '.api.Template', '10': 'templates'},
  ],
};

const Variable$json = const {
  '1': 'Variable',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '8': const {}, '10': 'name'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '8': const {}, '10': 'description'},
    const {'1': 'kvs', '3': 4, '4': 1, '5': 9, '8': const {}, '10': 'kvs'},
  ],
};

const GetVariableReq$json = const {
  '1': 'GetVariableReq',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

const DelVariableReq$json = const {
  '1': 'DelVariableReq',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

const PutVariableReq$json = const {
  '1': 'PutVariableReq',
  '2': const [
    const {'1': 'variable', '3': 1, '4': 1, '5': 11, '6': '.api.Variable', '10': 'variable'},
  ],
};

const UpdateVariableReq$json = const {
  '1': 'UpdateVariableReq',
  '2': const [
    const {'1': 'variable', '3': 1, '4': 1, '5': 11, '6': '.api.Variable', '10': 'variable'},
  ],
};

const ListVariableReq$json = const {
  '1': 'ListVariableReq',
  '2': const [
    const {'1': 'offset', '3': 1, '4': 1, '5': 3, '10': 'offset'},
    const {'1': 'limit', '3': 2, '4': 1, '5': 3, '10': 'limit'},
    const {'1': 'brief', '3': 3, '4': 1, '5': 8, '10': 'brief'},
  ],
};

const ListVariableRes$json = const {
  '1': 'ListVariableRes',
  '2': const [
    const {'1': 'variables', '3': 1, '4': 3, '5': 11, '6': '.api.Variable', '10': 'variables'},
  ],
};

const Task$json = const {
  '1': 'Task',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '8': const {}, '10': 'name'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '8': const {}, '10': 'description'},
    const {'1': 'templateIDs', '3': 4, '4': 3, '5': 9, '8': const {}, '10': 'templateIDs'},
    const {'1': 'variableIDs', '3': 5, '4': 3, '5': 9, '8': const {}, '10': 'variableIDs'},
  ],
};

const GetTaskReq$json = const {
  '1': 'GetTaskReq',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

const DelTaskReq$json = const {
  '1': 'DelTaskReq',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

const PutTaskReq$json = const {
  '1': 'PutTaskReq',
  '2': const [
    const {'1': 'task', '3': 1, '4': 1, '5': 11, '6': '.api.Task', '10': 'task'},
  ],
};

const UpdateTaskReq$json = const {
  '1': 'UpdateTaskReq',
  '2': const [
    const {'1': 'task', '3': 1, '4': 1, '5': 11, '6': '.api.Task', '10': 'task'},
  ],
};

const ListTaskReq$json = const {
  '1': 'ListTaskReq',
  '2': const [
    const {'1': 'offset', '3': 1, '4': 1, '5': 3, '10': 'offset'},
    const {'1': 'limit', '3': 2, '4': 1, '5': 3, '10': 'limit'},
    const {'1': 'brief', '3': 3, '4': 1, '5': 8, '10': 'brief'},
  ],
};

const ListTaskRes$json = const {
  '1': 'ListTaskRes',
  '2': const [
    const {'1': 'tasks', '3': 1, '4': 3, '5': 11, '6': '.api.Task', '10': 'tasks'},
  ],
};

const RunTaskReq$json = const {
  '1': 'RunTaskReq',
  '2': const [
    const {'1': 'taskID', '3': 1, '4': 1, '5': 9, '10': 'taskID'},
  ],
};

const RunTaskRes$json = const {
  '1': 'RunTaskRes',
  '2': const [
    const {'1': 'jobID', '3': 1, '4': 1, '5': 9, '10': 'jobID'},
    const {'1': 'exitCode', '3': 2, '4': 1, '5': 9, '10': 'exitCode'},
    const {'1': 'stdout', '3': 3, '4': 1, '5': 9, '10': 'stdout'},
    const {'1': 'stderr', '3': 4, '4': 1, '5': 9, '10': 'stderr'},
  ],
};

const CICDServiceBase$json = const {
  '1': 'CICDService',
  '2': const [
    const {'1': 'RunTask', '2': '.api.RunTaskReq', '3': '.api.RunTaskRes', '4': const {}},
    const {'1': 'GetTask', '2': '.api.GetTaskReq', '3': '.api.Task', '4': const {}},
    const {'1': 'DelTask', '2': '.api.DelTaskReq', '3': '.api.Empty', '4': const {}},
    const {'1': 'PutTask', '2': '.api.PutTaskReq', '3': '.api.Empty', '4': const {}},
    const {'1': 'UpdateTask', '2': '.api.UpdateTaskReq', '3': '.api.Empty', '4': const {}},
    const {'1': 'ListTask', '2': '.api.ListTaskReq', '3': '.api.ListTaskRes', '4': const {}},
    const {'1': 'GetTemplate', '2': '.api.GetTemplateReq', '3': '.api.Template', '4': const {}},
    const {'1': 'DelTemplate', '2': '.api.DelTemplateReq', '3': '.api.Empty', '4': const {}},
    const {'1': 'PutTemplate', '2': '.api.PutTemplateReq', '3': '.api.Empty', '4': const {}},
    const {'1': 'UpdateTemplate', '2': '.api.UpdateTemplateReq', '3': '.api.Empty', '4': const {}},
    const {'1': 'ListTemplate', '2': '.api.ListTemplateReq', '3': '.api.ListTemplateRes', '4': const {}},
    const {'1': 'GetVariable', '2': '.api.GetVariableReq', '3': '.api.Variable', '4': const {}},
    const {'1': 'DelVariable', '2': '.api.DelVariableReq', '3': '.api.Empty', '4': const {}},
    const {'1': 'PutVariable', '2': '.api.PutVariableReq', '3': '.api.Empty', '4': const {}},
    const {'1': 'UpdateVariable', '2': '.api.UpdateVariableReq', '3': '.api.Empty', '4': const {}},
    const {'1': 'ListVariable', '2': '.api.ListVariableReq', '3': '.api.ListVariableRes', '4': const {}},
  ],
};

const CICDServiceBase$messageJson = const {
  '.api.RunTaskReq': RunTaskReq$json,
  '.api.RunTaskRes': RunTaskRes$json,
  '.api.GetTaskReq': GetTaskReq$json,
  '.api.Task': Task$json,
  '.api.DelTaskReq': DelTaskReq$json,
  '.api.Empty': Empty$json,
  '.api.PutTaskReq': PutTaskReq$json,
  '.api.UpdateTaskReq': UpdateTaskReq$json,
  '.api.ListTaskReq': ListTaskReq$json,
  '.api.ListTaskRes': ListTaskRes$json,
  '.api.GetTemplateReq': GetTemplateReq$json,
  '.api.Template': Template$json,
  '.api.Template.ScriptTemplate': Template_ScriptTemplate$json,
  '.api.DelTemplateReq': DelTemplateReq$json,
  '.api.PutTemplateReq': PutTemplateReq$json,
  '.api.UpdateTemplateReq': UpdateTemplateReq$json,
  '.api.ListTemplateReq': ListTemplateReq$json,
  '.api.ListTemplateRes': ListTemplateRes$json,
  '.api.GetVariableReq': GetVariableReq$json,
  '.api.Variable': Variable$json,
  '.api.DelVariableReq': DelVariableReq$json,
  '.api.PutVariableReq': PutVariableReq$json,
  '.api.UpdateVariableReq': UpdateVariableReq$json,
  '.api.ListVariableReq': ListVariableReq$json,
  '.api.ListVariableRes': ListVariableRes$json,
};

