import 'package:flutter_test/flutter_test.dart';
import 'package:http_delegate/delegate_package.dart';
import 'package:http_delegate/http/dio_client.dart';
import 'package:http_delegate/model/test_json.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'http_req_delegate_impl_test.mocks.dart';
import 'test_json_reader.dart';

@GenerateMocks([
  DioClient,
  Dio,
  Response,
])
void main() {
  late MockDioClient mockClient;
  late HttpReqDelegate dataSourceImpl;
  late MockDio mockDio;
  const path = 'test/sample_data/';
  late MockResponse mockResponse;
  setUp(() async {
    mockClient = MockDioClient();
    mockDio = MockDio();
    mockResponse = MockResponse();
    dataSourceImpl = HttpReqDelegateImpl(dioClient: mockDio);
  });
  //
  group('Group HttpReqDelegateIml Data Source Implementation', () {
    test('Test DIO init on HttpReqDelegateIml', () async {
      final interceptorsValue = Interceptors();
      interceptorsValue.add(HttpInterceptor());
      when(mockDio.options).thenReturn(BaseOptions(baseUrl: "base"));
      when(mockDio.interceptors).thenReturn(interceptorsValue);
      when(mockClient.getInstance()).thenReturn(mockDio);
      final dynamic jsonStr = jsonReader(path, 'sample_data.json');
      when(mockResponse.data).thenReturn(jsonStr);
      when(mockResponse.statusCode).thenReturn(200);
      when(mockDio.get(any)).thenAnswer(
        (realInvocation) async => mockResponse,
      );
      final dynamic results = await dataSourceImpl
          .getForSingle<TestJson>("endPoint", TestJson(), {});
      verify(mockDio.get("endPoint"));
      expect(results, isA<TestJson>());
      expect(results.id, "idTest");
      expect(results.toJson(), jsonDecode(mockResponse.data));
      verifyNoMoreInteractions(mockDio);
    });

    test('Test list data on HttpReqDelegateIml', () async {
      final interceptorsValue = Interceptors();
      interceptorsValue.add(HttpInterceptor());
      when(mockDio.options).thenReturn(BaseOptions(baseUrl: "base"));
      when(mockDio.interceptors).thenReturn(interceptorsValue);
      when(mockClient.getInstance()).thenReturn(mockDio);
      final dynamic jsonStr = jsonReader(path, 'sample_list_data.json');
      when(mockResponse.data).thenReturn(jsonStr);
      when(mockResponse.statusCode).thenReturn(200);
      when(mockDio.get(any)).thenAnswer(
        (realInvocation) async => mockResponse,
      );
      final dynamic results = await dataSourceImpl.getForCollection<TestJson>(
          "endPoint",
          params: {},
          typeRef: TestJson());
      verify(mockDio.get("endPoint"));
      expect(results, isA<List<TestJson>>());
      expect(results[0].id, "idTest");
      expect(results[1].id, "idTest2");
      verifyNoMoreInteractions(mockDio);
    });

    test('Test post for list data on HttpReqDelegateIml', () async {
      final interceptorsValue = Interceptors();
      interceptorsValue.add(HttpInterceptor());
      when(mockDio.options).thenReturn(BaseOptions(baseUrl: "base"));
      when(mockDio.interceptors).thenReturn(interceptorsValue);
      when(mockClient.getInstance()).thenReturn(mockDio);
      final dynamic jsonStr = jsonReader(path, 'sample_list_data.json');
      when(mockResponse.data).thenReturn(jsonStr);
      when(mockResponse.statusCode).thenReturn(200);
      when(mockResponse.requestOptions)
          .thenReturn(RequestOptions(path: 'endPoint'));
      final future = Future.value(mockResponse);
      when(mockDio.post("endPoint")).thenAnswer(
        (realInvocation) async => future,
      );
      // final body = {"id": "idTest", "name": "Name Test"};

      // final dynamic results = await dataSourceImpl.postForCollection("endPoint",
      //     requestBody: body, typeRef: TestJson(), params: {});
      // verify(mockDio.post("endPoint", data: body));
      // expect(results, isA<List<TestJson>>());
      // expect(results[0].id, "idTest");
      // expect(results[1].id, "idTest2");
      // verifyNoMoreInteractions(mockDio);
    });
  });
}
