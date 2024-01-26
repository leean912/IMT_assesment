import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_demo/screens/home.dart';
import 'package:flutter_profile_demo/service_locator.dart';
import 'package:flutter_profile_demo/services/navigation_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Hive.initFlutter();

    sl.registerLazySingleton<Dio>(() {
      final dio = Dio();

      dio.options.connectTimeout = const Duration(seconds: 60);
      dio.options.receiveTimeout = const Duration(seconds: 60);

      return dio;
    });

    runApp(MyApp());
  }, (error, stackTrace) {
    if (kDebugMode) {
      print('Error caught: $error');
      print('Stack trace: $stackTrace');
    }
  });
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Profile Demo',
      onGenerateRoute: _appRouter.routSetting,
      navigatorKey: navKey,
      home: const HomePage(),
    );
  }
}
