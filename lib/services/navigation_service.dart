import 'package:flutter/material.dart';
import 'package:flutter_profile_demo/screens/favourite_profile_page.dart';
import 'package:flutter_profile_demo/screens/home.dart';
import 'package:flutter_profile_demo/screens/profile_details_page.dart';

class AppRouter {
  final _allRoutes = <String, Function(RouteSettings settings)>{
    HomePage.myHomePageroute: (settings) => const HomePage(),
    ProfileDetailsPage.profileDetailsPageRoute: (settings) => const ProfileDetailsPage(),
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
