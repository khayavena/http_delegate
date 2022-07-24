// GENERATED CODE - DO NOT MODIFY BY HAND
// Generated and consumed by 'simple_json'

import 'package:http_delegate/model/post.dart';
import 'package:http_delegate/model/test_json.dart';
import 'package:simple_json_mapper/simple_json_mapper.dart';

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

final _postMapper = JsonObjectMapper(
  (CustomJsonMapper mapper, Map<String, dynamic> json) => Post(
    userId: mapper.applyDynamicFromJsonConverter(json['userId'])!,
    id: mapper.applyDynamicFromJsonConverter(json['id'])!,
    title: mapper.applyDynamicFromJsonConverter(json['title'])!,
    body: mapper.applyDynamicFromJsonConverter(json['body'])!,
  ),
  (CustomJsonMapper mapper, Post instance) => <String, dynamic>{
    'userId': mapper.applyDynamicFromInstanceConverter(instance.userId),
    'id': mapper.applyDynamicFromInstanceConverter(instance.id),
    'title': mapper.applyDynamicFromInstanceConverter(instance.title),
    'body': mapper.applyDynamicFromInstanceConverter(instance.body),
  },
);

void init() {
  JsonMapper.register(_testjsonMapper);
  JsonMapper.register(_postMapper);

  JsonMapper.registerListCast((value) => value?.cast<TestJson>().toList());
  JsonMapper.registerListCast((value) => value?.cast<Post>().toList());
}
