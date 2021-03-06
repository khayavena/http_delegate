import 'package:flutter/material.dart';
import 'package:http_example/features/post/page/posts_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Network Req Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PostsPage(title: 'Posts Page'),
    );
  }
}
