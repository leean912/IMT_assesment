import 'package:flutter/material.dart';
import 'package:flutter_profile_demo/models/profile_details.dart';
import 'package:flutter_profile_demo/screens/profile_details_page.dart';
import 'package:flutter_profile_demo/services/navigation_service.dart';

class AvatarWidget extends StatelessWidget {
  final ProfileDetails profileDetails;
  final double width, height;
  final bool showName, isAbleToRoute;

  const AvatarWidget({
    required this.profileDetails,
    this.width = 70,
    this.height = 70,
    this.showName = false,
    this.isAbleToRoute = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => isAbleToRoute
          ? pushNamed(
              ProfileDetailsPage.profileDetailsPageRoute,
              arguments: profileDetails,
            )
          : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            width: width,
            height: height,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(profileDetails.profileUrl!),
                fit: BoxFit.contain,
              ),
            ),
          ),
          if (showName) Text(profileDetails.name!),
        ],
      ),
    );
  }
}
