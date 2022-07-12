import '../delegate_package.dart';

part 'test_json.g.dart';

@JsonSerializable()
class TestJson extends FromJsonModel<TestJson> {
  late String id;
  late String name;

  @override
  TestJson create() => TestJson();

  @override
  TestJson fromJson(Map<String, dynamic> json) {
    return _$TestJsonFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$TestJsonToJson(this);
}
