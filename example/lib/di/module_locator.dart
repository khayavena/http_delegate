import 'package:get_it/get_it.dart';
import 'package:http_delegate/delegate_package.dart';
import 'package:http_example/env/env_config.dart';
import 'package:http_example/mapper.g.dart' as json_mapper;

import '../features/post/remote_data/remote_post_service.dart';
import '../features/post/remote_data/remote_post_service_impl.dart';
import '../features/post/repository/post_repository.dart';
import '../features/post/repository/post_repository_impl.dart';

final _locator = GetIt.instance;

GetIt get moduleLocator => _locator;

Future<void> initRemoteDataModules() async {
  json_mapper.init();
  final dioClient = DioClient().getInstance(
      baseUrl: EnvConfig.baseUrl,
      interceptors: [
        HttpDelegateInterceptor(headers: {'api-key': EnvConfig.apiKey})
      ],
      debugMode: true);
  _locator.registerLazySingleton<HttpReqDelegate>(
      () => HttpReqDelegateImpl(dioClient: dioClient));
  _initServiceAndRepositoryModules();
}

void _initServiceAndRepositoryModules() {
  _locator.registerLazySingleton<RemotePostService>(
      () => RemoteUserServiceImpl(reqDelegate: _locator<HttpReqDelegate>()));
  _locator.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(postService: _locator<RemotePostService>()));
}
