import 'package:http_delegate/delegate_package.dart';

import 'http_req_delegate_impl_test.mocks.dart';
import 'test_json_reader.dart';

@GenerateMocks([
  DioClient,
  Dio,
  Response,
])
void main() {
  initJsonMapperObjects(); //Init Json Mapper factory for all models
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
  group('Test-Get-Group HttpReqDelegateIml Data Source Implementation ', () {
    test('Test DIO init on HttpReqDelegateIml', () async {
      final interceptorsValue = Interceptors();
      interceptorsValue.add(HttpDelegateInterceptor());
      when(mockDio.options).thenReturn(BaseOptions(baseUrl: "base"));
      when(mockDio.interceptors).thenReturn(interceptorsValue);
      when(mockClient.getInstance()).thenReturn(mockDio);
      final dynamic jsonStr = jsonReader(path, 'test_json.json');
      when(mockResponse.data).thenReturn(jsonStr);
      when(mockResponse.statusCode).thenReturn(200);
      when(mockDio.get(any)).thenAnswer(
        (realInvocation) async => mockResponse,
      );
      final dynamic results = await dataSourceImpl.get<TestJson>(
        "endPoint",
      );
      verify(mockDio.get("endPoint"));
      expect(results, isA<TestJson>());
      expect(results.id, "idTest");
      expect(results.toJson(), jsonDecode(mockResponse.data));
      verifyNoMoreInteractions(mockDio);
    });

    test('Test list data on HttpReqDelegateIml', () async {
      final interceptorsValue = Interceptors();
      interceptorsValue.add(HttpDelegateInterceptor());
      when(mockDio.options).thenReturn(BaseOptions(baseUrl: "base"));
      when(mockDio.interceptors).thenReturn(interceptorsValue);
      when(mockClient.getInstance()).thenReturn(mockDio);
      final dynamic jsonStr = jsonReader(path, 'test_list_json.json');
      when(mockResponse.data).thenReturn(jsonStr);
      when(mockResponse.statusCode).thenReturn(200);
      when(mockDio.get(any)).thenAnswer(
        (realInvocation) async => mockResponse,
      );
      final dynamic results = await dataSourceImpl.get<List<TestJson>>(
        "endPoint",
      );
      verify(mockDio.get("endPoint"));
      expect(results, isA<List<TestJson>>());
      expect(results[0].id, "idTest");
      expect(results[1].id, "idTest2");
      verifyNoMoreInteractions(mockDio);
    });

    test('Test-DioError on HttpReqDelegateIml implementation', () async {
      final interceptorsValue = Interceptors();
      interceptorsValue.add(HttpDelegateInterceptor());
      when(mockDio.options).thenReturn(BaseOptions(baseUrl: "base"));
      when(mockDio.interceptors).thenReturn(interceptorsValue);
      when(mockClient.getInstance()).thenReturn(mockDio);
      when(mockResponse.data).thenReturn({"error": "something went wrong"});
      when(mockResponse.statusCode).thenReturn(501);
      when(mockDio.get(any)).thenAnswer(
        (realInvocation) async =>
            throw DioError(requestOptions: RequestOptions(path: 'endPoint')),
      );
      expect(
          () => dataSourceImpl.get<TestJson>(
                "endPoint",
              ),
          throwsA(const TypeMatcher<HttpDelegateException>()));
    });
    test('Test-Error on HttpReqDelegateIml implementation', () async {
      final interceptorsValue = Interceptors();
      interceptorsValue.add(HttpDelegateInterceptor());
      when(mockDio.options).thenReturn(BaseOptions(baseUrl: "base"));
      when(mockDio.interceptors).thenReturn(interceptorsValue);
      when(mockClient.getInstance()).thenReturn(mockDio);
      when(mockResponse.data).thenReturn({"error": "something went wrong"});
      when(mockResponse.statusCode).thenReturn(201);
      when(mockDio.get(any)).thenAnswer(
        (realInvocation) async => throw Error(),
      );
      expect(
          () => dataSourceImpl.get<TestJson>(
                "endPoint",
              ),
          throwsA(const TypeMatcher<HttpDelegateGeneralException>()));
    });
  });
}
