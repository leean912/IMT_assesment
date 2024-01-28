import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_profile_demo/services/navigation_service.dart';
import 'package:flutter_test/flutter_test.dart';

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
