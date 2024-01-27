import 'package:equatable/equatable.dart';

class ProfileDetails extends Equatable {
  final String? profileUrl, name, email, state, country, national, uuid;

  const ProfileDetails({
    this.profileUrl,
    this.name,
    this.email,
    this.state,
    this.country,
    this.national,
    this.uuid,
  });

  factory ProfileDetails.fromJson({
    required Map<String, dynamic>? response,
    bool isUS = true,
  }) {
    if (response == null) {
      return const ProfileDetails();
    }

    if (!isUS && response["nat"].toString() == 'US') {
      return const ProfileDetails();
    } else if (isUS && response["nat"].toString() != 'US') {
      return const ProfileDetails();
    }

    return ProfileDetails(
      profileUrl: response["picture"]["medium"],
      name: response["name"]["first"] + response["name"]["last"],
      email: response["email"],
      state: response["location"]["state"],
      country: response["location"]["country"],
      national: response["nat"],
      uuid: response["login"]["uuid"],
    );
  }

  ProfileDetails withCountryAndProfileUrl() {
    return ProfileDetails(
      country: country,
      profileUrl: profileUrl,
    );
  }

  ProfileDetails withNameAndProfileUrl() {
    return ProfileDetails(
      name: name,
      profileUrl: profileUrl,
    );
  }

  @override
  List<Object?> get props => [
        profileUrl,
        name,
        email,
        state,
        country,
        national,
      ];
}
