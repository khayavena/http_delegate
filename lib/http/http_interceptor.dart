import '../delegate_package.dart';

class HttpDelegateInterceptor extends Interceptor {
  Map<String, dynamic>? headers;

  HttpDelegateInterceptor({this.headers});

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
