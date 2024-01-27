import 'package:flutter/material.dart';
import 'package:flutter_profile_demo/models/profile_details.dart';
import 'package:flutter_profile_demo/screens/profile_details_page.dart';
import 'package:flutter_profile_demo/services/navigation_service.dart';

class AvatarWidget extends StatelessWidget {
  final ProfileDetails profileDetails;

  const AvatarWidget({
    required this.profileDetails,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => pushNamed(
        ProfileDetailsPage.profileDetailsPageRoute,
        arguments: profileDetails,
      ),
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(profileDetails.profileUrl!),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
