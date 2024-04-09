import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_demo/cubits/favourite_profile_cubit/db/favourite_profile_db_cubit.dart';
import 'package:flutter_profile_demo/cubits/favourite_profile_cubit/favourite_profile_cubit.dart';
import 'package:flutter_profile_demo/db_model/profile_details_db.dart';
import 'package:flutter_profile_demo/service_locator.dart';
import 'package:flutter_profile_demo/services/navigation_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Make sure to call sl.reset() before calling this function to reset any registered types
Future<Widget> getTestMaterialAppBoilerplate(
  Widget widgetToTest, {
  NavigatorObserver? navObserver,
}) async {
  return TestApp(
    widgetToTest: widgetToTest,
    navObserver: navObserver,
  );
}

class TestApp extends StatefulWidget {
  final NavigatorObserver? navObserver;
  final Widget widgetToTest;

  const TestApp({
    Key? key,
    required this.widgetToTest,
    this.navObserver,
  }) : super(key: key);

  @override
  TestAppState createState() => TestAppState();
}

class TestAppState extends State<TestApp> {
  late AppRouter _appRouter;

  @override
  void initState() {
    super.initState();

    _appRouter = AppRouter();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Profile Demo',
      navigatorKey: navKey,
      navigatorObservers: [
        if (widget.navObserver != null) widget.navObserver!,
      ],
      onGenerateRoute: _appRouter.routSetting,
      home: Scaffold(
        body: widget.widgetToTest,
      ),
    );
  }
}

registerSl({FavouriteProfileCubit? favouriteProfileCubit}) {
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<FavouriteProfileCubit>(() => favouriteProfileCubit ?? FavouriteProfileCubit.initial());
}

registerDbSl({
  Box<ProfileDetailsDb>? profileBox,
  FavouriteProfileDbCubit? favouriteProfileDbCubit,
}) async {
  sl.registerLazySingleton<Box<ProfileDetailsDb>>(() => profileBox ?? Hive.box<ProfileDetailsDb>('profiles'));
  sl.registerLazySingleton<FavouriteProfileDbCubit>(() => favouriteProfileDbCubit ?? FavouriteProfileDbCubit.initial());
}
