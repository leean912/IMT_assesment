import 'package:flutter_profile_demo/models/profile_details.dart';
import 'package:hive/hive.dart';
part 'profile_details_db.g.dart';

@HiveType(typeId: 0)
class ProfileDetailsDb {

  @HiveField(0)
  final ProfileDetails profileDetails;

  const ProfileDetailsDb(this.profileDetails);
}