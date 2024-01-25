import 'package:flutter/material.dart';
import 'package:flutter_profile_demo/screens/favourite_profile_page.dart';
import 'package:flutter_profile_demo/screens/home.dart';
import 'package:flutter_profile_demo/screens/profile_details_page.dart';

routSetting(RouteSettings settings) {
  final String? routeName = settings.name;

        if (routeName == MyHomePage.myHomePageroute) {
          return MaterialPageRoute(
            builder: (BuildContext context) {
              return const MyHomePage();
            },
          );
        }

        if (routeName == ProfileDetailsPage.profileDetailsPageRoute) {
          return MaterialPageRoute(
            builder: (BuildContext context) {
              return const ProfileDetailsPage();
            },
          );
        }

        if (routeName == FavouriteProfilePage.favouriteProfilePageRoute) {
          return MaterialPageRoute(
            builder: (BuildContext context) {
              return const FavouriteProfilePage();
            },
          );
        }
        
        return null;
}