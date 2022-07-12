import 'package:flutter_test/flutter_test.dart';
import 'package:http_delegate/delegate_package.dart';
import 'package:http_delegate/http/dio_client.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'dio_client_test.mocks.dart';

@GenerateMocks([DioClient, Dio])
void main() {
  late MockDioClient mockClient;
  late MockDio dio;

  setUp(() async {
    mockClient = MockDioClient();
    dio = MockDio();
  });

  group('Group Dio Validation Implementation', () {
    test('Test  DIO with base url and  without interceptors Implementation ',
        () async {
      when(dio.options).thenReturn(BaseOptions(baseUrl: "base"));
      when(dio.interceptors).thenReturn(Interceptors());
      when(mockClient.dio).thenReturn(dio);
      when(mockClient.getInstance(
              baseUrl: "base", interceptors: [], debugMode: false))
          .thenReturn(dio);
      final value = mockClient.getInstance(
          baseUrl: "base", interceptors: [], debugMode: false);
      expect(value, dio);
      expect("base", mockClient.dio.options.baseUrl);
      expect(mockClient.dio.interceptors, []);
    });
    test('Test  DIO with base url and interceptors Implementation ', () async {
      final interceptorsValue = Interceptors();
      interceptorsValue.add(HttpInterceptor());
      when(dio.options).thenReturn(BaseOptions(baseUrl: "base"));
      when(dio.interceptors).thenReturn(interceptorsValue);
      when(mockClient.dio).thenReturn(dio);
      when(mockClient.getInstance(
              baseUrl: "base", interceptors: [], debugMode: false))
          .thenReturn(dio);
      final value = mockClient.getInstance(
          baseUrl: "base", interceptors: [], debugMode: false);
      expect(value, dio);
      expect("base", mockClient.dio.options.baseUrl);
      expect(mockClient.dio.interceptors, interceptorsValue);
    });
  });
}
