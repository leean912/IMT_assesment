import 'package:flutter/material.dart';
import 'package:flutter_profile_demo/components/home/avatar_widget.dart';
import 'package:flutter_profile_demo/models/profile_details.dart';

class AvatarListWidget extends StatelessWidget {
  final List<ProfileDetails> profileDetailsList;

  const AvatarListWidget({
    required this.profileDetailsList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: profileDetailsList.length,
        itemBuilder: (context, index) {
          return AvatarWidget(
            profileDetails: profileDetailsList[index],
          );
        },
      ),
    );
  }
}
