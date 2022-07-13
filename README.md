<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

TODO: Implementation of full test coverage.

## Features

TODO: Post byte array and and encryption implementations

## Getting started

Make sure u have the following dev dependencies in your pubspec.yml build_runner: ^2.1.11
json_serializable: ^6.3.1 Also add json_annotation: ^4.6.0 in dependencies in your pubspec.yml

## Usage

flutter create http_example TODO: Include short and useful examples for package users. Add longer
examples to `/example` folder.

```dart
import '../delegate_package.dart';

part 'test_json.g.dart';

@JsonSerializable()
class TestJson extends FromJsonModel<TestJson> {
  late String id;
  late String name;

  @override
  TestJson create() => TestJson();

  @override
  TestJson fromJson(Map<String, dynamic> json) {
    return _$TestJsonFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$TestJsonToJson(this);
}

method() async {
  final interceptor = HttpInterceptor(headers: {"token": "token"});
  final doiClient = await DioClient().getInstance(baseUrl: "baseUrl", debugMode: true,);
  final HttpReqDelegate delegate = HttpReqDelegateImpl(doiClient: dioClient);
  /// perform your http request ///
  final  results = await dataSourceImpl
      .getForSingle<TestJson>("endPoint", TestJson(), {});
}

```

## Additional information

TODO: I will implement DI and BLOCK pattern in example project.
