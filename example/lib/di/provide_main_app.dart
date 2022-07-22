import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_example/di/module_locator.dart';

import '../features/main/main_app.dart';
import '../features/post/bloc/get_posts_bloc.dart';
import '../features/post/repository/post_repository.dart';

Future<void> provideMainApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initRemoteDataModules();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<GetUsersBloc>(
          create: (BuildContext context) =>
              GetUsersBloc(repository: moduleLocator<UserRepository>()),
        )
      ],
      child: const MainApp(),
    ),
  );
}
