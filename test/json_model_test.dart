import 'package:flutter_test/flutter_test.dart';
import 'package:http_delegate/model/test_json.dart';

void main() {
  test('TestJson is instance', () {
    final instance = TestJson();
    expect(instance, isA<TestJson>());
    // final calculator = HttpDelegate();
    // expect(calculator.addOne(2), 3);
    // expect(calculator.addOne(-7), -6);
    // expect(calculator.addOne(0), 1);
  });
}
