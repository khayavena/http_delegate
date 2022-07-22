// GENERATED CODE - DO NOT MODIFY BY HAND
// Generated and consumed by 'simple_json'

import 'package:http_example/features/post/domain/post.dart';
import 'package:simple_json_mapper/simple_json_mapper.dart';

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
  JsonMapper.register(_postMapper);

  JsonMapper.registerListCast((value) => value?.cast<Post>().toList());
}
