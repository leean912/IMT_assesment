import 'package:dio/dio.dart';

class ProfileServiceRepository {
  ProfileServiceRepository();
  final dio = Dio();

  Future<dynamic> getProfileList() async {
    final response = await dio.get('https://randomuser.me/api/');

    return response;
  }
}
