// GENERATED CODE - DO NOT MODIFY BY HAND
// Generated and consumed by 'simple_json' 

import 'package:simple_json_mapper/simple_json_mapper.dart';
import 'package:http_delegate/model/test_json.dart';

final _testjsonMapper = JsonObjectMapper(
  (CustomJsonMapper mapper, Map<String, dynamic> json) => TestJson(
    id: mapper.applyDynamicFromJsonConverter(json['id'])!,
    name: mapper.applyDynamicFromJsonConverter(json['name'])!,
  ),
  (CustomJsonMapper mapper, TestJson instance) => <String, dynamic>{
    'id': mapper.applyDynamicFromInstanceConverter(instance.id),
    'name': mapper.applyDynamicFromInstanceConverter(instance.name),
  },
);

void init() {
  JsonMapper.register(_testjsonMapper); 

  

  JsonMapper.registerListCast((value) => value?.cast<TestJson>().toList());
}
    