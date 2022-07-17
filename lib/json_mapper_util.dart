import 'package:http_delegate/mapper.g.dart' as json_mapper_generated;
import 'package:simple_json_mapper/simple_json_mapper.dart';
Map<String, dynamic> serializeToJson(Object obj) {
  return JsonMapper.serializeToMap(obj) ?? {};
}

void initJsonMapperObjects() {
  json_mapper_generated.init();
}
