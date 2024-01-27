import 'package:flutter/material.dart';
import 'package:flutter_profile_demo/models/profile_details.dart';
import 'package:flutter_profile_demo/screens/favourite_profile_page.dart';
import 'package:flutter_profile_demo/screens/home.dart';
import 'package:flutter_profile_demo/screens/profile_details_page.dart';

final navKey = GlobalKey<NavigatorState>();

class AppRouter {
  final _allRoutes = <String, Function(RouteSettings settings)>{
    HomePage.myHomePageroute: (settings) => const HomePage(),
    ProfileDetailsPage.profileDetailsPageRoute: (settings) => ProfileDetailsPage(settings.arguments as ProfileDetails),
    FavouriteProfilePage.favouriteProfilePageRoute: (settings) => const FavouriteProfilePage(),
  };

  MaterialPageRoute<dynamic> routSetting(RouteSettings settings) {
    Function(RouteSettings)? builder = _allRoutes[settings.name!];

    Widget childWidget = (builder!(settings)) as Widget;

    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => childWidget,
    );
  }
}

Future<T?> pushNamed<T extends Object?>(
  String routeName, {
  Object? arguments,
}) {
  return navKey.currentState!.pushNamed<T>(routeName, arguments: arguments);
}

void pop<T extends Object?>([T? data]) {
  return navKey.currentState!.pop<T>(data);
}
