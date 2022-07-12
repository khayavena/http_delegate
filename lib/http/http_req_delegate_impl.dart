library http_delegate;

import '../delegate_package.dart';
import 'http_delegate_exception.dart';
import 'http_delegate_general_exception.dart';

class HttpReqDelegateImpl implements HttpReqDelegate {
  Dio dioClient;

  HttpReqDelegateImpl({required this.dioClient});

  @override
  Future<T> getForSingle<T extends FromJsonModel>(
      String endPoint, T type, Map<String, dynamic>? params) async {
    try {
      final response = await dioClient.get(endPoint);
      dynamic jsonResult = jsonDecode(response.data);
      final model = type.fromJson(jsonResult);
      return model;
    } on DioError catch (e) {
      throw HttpDelegateException(e);
    } on Error catch (e) {
      throw HttpDelegateGeneralException(e);
    }
  }

  @override
  Future<List<T>> getForCollection<T extends FromJsonModel>(String endPoint,
      {Map<String, String>? params, required T typeRef}) async {
    try {
      final response = await dioClient.get(endPoint);
      dynamic jsonResult = jsonDecode(response.data);
      return List<T>.from(
          jsonResult.map((json) => typeRef.create().fromJson(json)));
    } on DioError catch (e) {
      throw HttpDelegateException(e);
    } on Error catch (e) {
      throw HttpDelegateGeneralException(e);
    }
  }

  @override
  Future<T> postForSingle<T extends FromJsonModel>(String endPoint,
      {Map<String, dynamic>? params,
      required T typeRef,
      required Map<String, dynamic> requestBody,
      data}) async {
    try {
      final response = await dioClient.post(endPoint, data: requestBody);
      dynamic jsonResult = jsonDecode(response.data);
      final model = typeRef.fromJson(jsonResult);
      return model;
    } on DioError catch (e) {
      throw HttpDelegateException(e);
    } on Error catch (e) {
      throw HttpDelegateGeneralException(e);
    }
  }

  @override
  Future<List<T>> postForCollection<T extends FromJsonModel>(String endPoint,
      {Map<String, String>? params,
      required T typeRef,
      required Map<String, dynamic> requestBody}) async {
    try {
      final response = await dioClient.post(endPoint, data: requestBody);
      dynamic jsonResult = jsonDecode(response.data);
      return List<T>.from(
          jsonResult.map((json) => typeRef.create().fromJson(json)));
    } on DioError catch (e) {
      throw HttpDelegateException(e);
    } on Error catch (e) {
      throw HttpDelegateGeneralException(e);
    }
  }

  @override
  Future<T> postMultiPart<T extends FromJsonModel>(
      String endPoint, String fileKey, String path, T typeRef) async {
    final formData = FormData.fromMap({
      fileKey: await MultipartFile.fromFile(path),
    });
    try {
      dynamic jsonResult = await dioClient.post(endPoint, data: formData);
      return typeRef.fromJson(jsonResult);
    } on DioError catch (e) {
      throw HttpDelegateException(e);
    } on Error catch (e) {
      throw HttpDelegateGeneralException(e);
    }
  }
}
