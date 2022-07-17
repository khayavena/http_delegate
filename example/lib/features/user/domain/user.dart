import 'package:http_delegate/delegate_package.dart';
import 'package:simple_json_mapper/simple_json_mapper.dart';
@JsonObject()
class User extends JsonModel {
  final String id;
  final String name;

  User({required this.id, required this.name});
}
