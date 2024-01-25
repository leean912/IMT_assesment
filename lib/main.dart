import 'package:flutter/material.dart';
import 'package:flutter_profile_demo/screens/home.dart';
import 'package:flutter_profile_demo/services/navigation_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Profile Demo',
      onGenerateRoute: _appRouter.routSetting,
      home: const MyHomePage(),
    );
  }
}
