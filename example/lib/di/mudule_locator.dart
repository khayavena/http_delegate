import 'package:get_it/get_it.dart';
import 'package:http_delegate/delegate_package.dart';
import 'package:http_example/env/env_config.dart';
import 'package:http_example/mapper.g.dart' as json_mapper;

import '../features/user/remote_data/remote_user_service.dart';
import '../features/user/remote_data/remote_user_service_impl.dart';
import '../features/user/repository/user_repository.dart';
import '../features/user/repository/user_repository_impl.dart';

final _locator = GetIt.instance;

GetIt get locator => _locator;

void initRemoteDataModules() {
  json_mapper.init();
  final dioClient = DioClient().getInstance(
      baseUrl: EnvConfig.base_url,
      interceptors: [
        HttpDelegateInterceptor(headers: {'api-key': EnvConfig.api_key})
      ],
      debugMode: true);
  _locator.registerLazySingleton<HttpReqDelegate>(
      () => HttpReqDelegateImpl(dioClient: dioClient));
}

void initServiceAndRepositoryModules() {
  _locator.registerLazySingleton<RemoteUserService>(
      () => RemoteUserServiceImpl(reqDelegate: _locator<HttpReqDelegate>()));
  _locator.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(userService: _locator<RemoteUserService>()));
}
