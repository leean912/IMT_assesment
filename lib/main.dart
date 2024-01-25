import 'package:flutter/material.dart';
import 'package:flutter_profile_demo/screens/home.dart';
import 'package:flutter_profile_demo/services/navigation_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Profile Demo',
      initialRoute: MyHomePage.myHomePageroute,
      onGenerateRoute: (RouteSettings settings) => routSetting(settings),
      home: const MyHomePage(),
    );
  }
}
