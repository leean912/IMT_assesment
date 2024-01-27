import 'package:flutter/material.dart';
import 'package:flutter_profile_demo/components/home/avatar_widget.dart';
import 'package:flutter_profile_demo/models/profile_details.dart';

class AvatarFavouriteWidget extends StatelessWidget {
  final ProfileDetails profileDetails;
  final GestureTapCallback favouriteFunction;
  final bool isFavourited;

  const AvatarFavouriteWidget({
    required this.profileDetails,
    required this.favouriteFunction,
    this.isFavourited = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 170,
        child: Stack(
          children: [
            Center(
              child: AvatarWidget(
                height: 120,
                width: 120,
                profileDetails: profileDetails,
                showName: true,
                isAbleToRoute: false,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                  onPressed: favouriteFunction,
                  icon: Icon(
                    isFavourited ? Icons.favorite_rounded : Icons.favorite_outline_rounded,
                    color: Colors.red,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
