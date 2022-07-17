// GENERATED CODE - DO NOT MODIFY BY HAND
// Generated and consumed by 'simple_json' 

import 'package:simple_json_mapper/simple_json_mapper.dart';
import 'package:http_example/features/user/domain/user.dart';

final _userMapper = JsonObjectMapper(
  (CustomJsonMapper mapper, Map<String, dynamic> json) => User(
    id: mapper.applyDynamicFromJsonConverter(json['id'])!,
    name: mapper.applyDynamicFromJsonConverter(json['name'])!,
  ),
  (CustomJsonMapper mapper, User instance) => <String, dynamic>{
    'id': mapper.applyDynamicFromInstanceConverter(instance.id),
    'name': mapper.applyDynamicFromInstanceConverter(instance.name),
  },
);

void init() {
  JsonMapper.register(_userMapper); 

  

  JsonMapper.registerListCast((value) => value?.cast<User>().toList());
}
    