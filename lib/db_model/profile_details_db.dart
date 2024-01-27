import 'package:hive/hive.dart';
part 'profile_details_db.g.dart';

@HiveType(typeId: 0)
class ProfileDetailsDb {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String profileUrl;

  @HiveField(3)
  final String state;

  @HiveField(4)
  final String country;

  @HiveField(5)
  final String national;

  @HiveField(6)
  final String uuid;

  const ProfileDetailsDb({
    required this.name,
    required this.email,
    required this.profileUrl,
    required this.state,
    required this.country,
    required this.national,
    required this.uuid,
  });
}
