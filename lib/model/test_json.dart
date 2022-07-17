import 'package:simple_json_mapper/simple_json_mapper.dart';

import 'json_model.dart';

@JsonObject()
class TestJson extends JsonModel {
  final String id;
  final String name;

  TestJson({required this.id, required this.name});
}
