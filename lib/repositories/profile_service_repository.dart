import 'package:dio/dio.dart';
import 'package:flutter_profile_demo/service_locator.dart';

class ProfileServiceRepository {
  ProfileServiceRepository();

  final dio = sl.get<Dio>();

  Future<dynamic> getProfileList() async {
    //add apihandler in future
    final response = await dio.get('https://randomuser.me/api/?results=20');

    return response;
  }
}
