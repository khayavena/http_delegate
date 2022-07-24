<!-- 
This README describes the package. 
This package is meant to simplify internal api integration, you can clone and use even update the package
to fit your business needs. There is also example app that shows how to use the package. 
-->

## Features

BLOC pattern Repository Dependency injection(Get It)
Unit testing

## Getting started

git clone https://github.com/khayavena/http_delegate.git
cd htt_delegate, flutter pub get, flutter pub run build_runner build --delete-conflicting-outputs cd
example cd flutter pub get flutter pub run build_runner build --delete-conflicting-outputs

## Usage

```dart
///Define models inside your inside http_delegate/lib/model
@JsonObject()
class Post extends JsonModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({required this.userId,
    required this.id,
    required this.title,
    required this.body});
}


functionality() async {
  //Add interceptor
  final interceptor = HttpInterceptor(headers: {"token": "token"});
  //init Dio http client
  final doiClient = await DioClient().getInstance(baseUrl: "baseUrl", debugMode: true,);
  //init Init http delegate for your app.
  final HttpReqDelegate delegate = HttpReqDelegateImpl(doiClient: dioClient);

  /// perform your http request ///
  final results = await delegate
      .get<Post>("endPoint");
  final results = await delegate
      .get<List<Post>>("endPoint");
}

```

## Additional information

For more information and detailed understanding just go through example project
