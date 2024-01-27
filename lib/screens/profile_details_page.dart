import 'package:flutter/material.dart';
import 'package:flutter_profile_demo/components/profile_details_page/avatar_favourite_widget.dart';
import 'package:flutter_profile_demo/models/profile_details.dart';
import 'package:flutter_profile_demo/services/navigation_service.dart';

class ProfileDetailsPage extends StatefulWidget {
  static const profileDetailsPageRoute = '/profileDetailsPageRoute';

  final ProfileDetails? profileDetails;

  const ProfileDetailsPage(
    this.profileDetails, {
    super.key,
  });

  @override
  State<ProfileDetailsPage> createState() => _ProfileDetailsPageState();
}

class _ProfileDetailsPageState extends State<ProfileDetailsPage> {
  late ProfileDetails? _profileDetails;

  @override
  void initState() {
    super.initState();

    _profileDetails = widget.profileDetails;
  }

  @override
  Widget build(BuildContext context) {
    const titleFontWeight = FontWeight.bold;

    return Scaffold(
        appBar: AppBar(
          leading: const IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: pop,
          ),
          centerTitle: false,
          title: const Text('Profile Overview'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AvatarFavouriteWidget(
                profileDetails: _profileDetails!,
                favouriteFunction: () {},
              ),
              const SizedBox(height: 15),
              const Text(
                'Email',
                style: TextStyle(fontWeight: titleFontWeight),
              ),
              Text('${_profileDetails?.email}'),
              const Text(
                'State',
                style: TextStyle(fontWeight: titleFontWeight),
              ),
              Text('${_profileDetails?.state}'),
              const Text(
                'Country',
                style: TextStyle(fontWeight: titleFontWeight),
              ),
              Text('${_profileDetails?.country}'),
            ],
          ),
        ));
  }
}
