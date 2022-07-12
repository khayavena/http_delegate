import '../delegate_package.dart';

abstract class HttpReqDelegate {
  Future<T> getForSingle<T extends FromJsonModel>(
      String endPoint, T typeRef, Map<String, dynamic>? params);

  Future<List<T>> getForCollection<T extends FromJsonModel>(String endPoint,
      {Map<String, String>? params, required T typeRef});

  Future<T> postForSingle<T extends FromJsonModel>(String endPoint,
      {Map<String, dynamic>? params,
      required T typeRef,
      required Map<String, dynamic> requestBody,
      data});

  Future<List<T>> postForCollection<T extends FromJsonModel>(String endPoint,
      {Map<String, String>? params,
      required T typeRef,
      required Map<String, dynamic> requestBody});

  Future<T> postMultiPart<T extends FromJsonModel>(
      String endPoint, String fileKey, String path, T typeRef);
}
