abstract class HttpReqDelegate {
  Future<T> get<T>(String endPoint, {Map<String, dynamic>? params});

  Future<T> post<T>(String endPoint,
      {Map<String, dynamic>? params,
      required Map<String, dynamic> requestBody});

  Future<T> postMultiPart<T>(
      String endPoint, String fileKey, String sourcePath);
}
