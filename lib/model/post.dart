import 'package:http_delegate/model/json_model.dart';
import 'package:simple_json_mapper/simple_json_mapper.dart';

@JsonObject()
class Post extends JsonModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});
}
