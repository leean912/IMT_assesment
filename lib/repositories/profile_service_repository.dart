import 'package:dio/dio.dart';
import 'package:flutter_profile_demo/service_locator.dart';

class ProfileServiceRepository {
  ProfileServiceRepository();

  final dio = sl.get<Dio>();

  Future<dynamic> getProfileList() async {
    final response = await dio.get('https://randomuser.me/api/?results=15');

    return response;
  }
}
