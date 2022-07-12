import '../delegate_package.dart';

class HttpInterceptor extends Interceptor {
  Map<String, dynamic>? headers;

  HttpInterceptor({this.headers});

  @override
  onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    options.headers = headers;
    options.headers[HttpHeaders.contentTypeHeader] = ContentType.json.value;
    options.responseType = ResponseType.json;
    return super.onRequest(options, handler);
  }
}
