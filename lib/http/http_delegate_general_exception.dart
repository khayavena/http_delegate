class HttpDelegateGeneralException extends Error {
  late final Error error;

  HttpDelegateGeneralException(this.error);
}
