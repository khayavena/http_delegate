library http_delegate;

import 'package:simple_json_mapper/simple_json_mapper.dart';

import '../delegate_package.dart';

class HttpReqDelegateImpl implements HttpReqDelegate {
  Dio dioClient;

  HttpReqDelegateImpl({required this.dioClient});

  @override
  Future<T> get<T>(String endPoint, {Map<String, dynamic>? params}) async {
    try {
      final response = await dioClient.get(endPoint);
      final result = JsonMapper.deserialize<T>(jsonDecode(response.data));
      return Future.value(result);
    } on DioError catch (e) {
      throw HttpDelegateException(e);
    } on Error catch (e) {
      throw HttpDelegateGeneralException(e);
    }
  }

  @override
  Future<T> post<T>(String endPoint,
      {Map<String, dynamic>? params,
      required Map<String, dynamic> requestBody}) async {
    try {
      final response = await dioClient.post(endPoint, data: requestBody);
      final result = JsonMapper.deserialize<T>(jsonDecode(response.data));
      return Future.value(result);
    } on DioError catch (e) {
      throw HttpDelegateException(e);
    } on Error catch (e) {
      throw HttpDelegateGeneralException(e);
    }
  }

  @override
  Future<T> postMultiPart<T>(
      String endPoint, String fileKey, String path) async {
    final formData = FormData.fromMap({
      fileKey: await MultipartFile.fromFile(path),
    });
    try {
      dynamic response = await dioClient.post(endPoint, data: formData);
      final result = JsonMapper.deserialize<T>(jsonDecode(response.data));
      return Future.value(result);
    } on DioError catch (e) {
      throw HttpDelegateException(e);
    } on Error catch (e) {
      throw HttpDelegateGeneralException(e);
    }
  }
}
