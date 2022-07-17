import 'package:simple_json_mapper/simple_json_mapper.dart';

abstract class JsonModel {
  Map<String, dynamic> toJson() {
    return JsonMapper.serializeToMap(this) ?? {};
  }
}
