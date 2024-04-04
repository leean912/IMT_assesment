import 'package:flutter/material.dart';
import 'package:flutter_profile_demo/components/home/avatar_widget.dart';
import 'package:flutter_profile_demo/db_model/profile_details_db.dart';
import 'package:flutter_profile_demo/models/profile_details.dart';
import 'package:flutter_profile_demo/screens/profile_details_page.dart';
import 'package:flutter_profile_demo/services/navigation_service.dart';

class FavouriteProfileTile extends StatelessWidget {
  final ProfileDetailsDb favouriteProfile;
  final Function(DismissDirection) onDismissedCallBack;

  const FavouriteProfileTile({
    required this.favouriteProfile,
    required this.onDismissedCallBack,
    super.key,
  }) : assert(key != null, 'must pass a key value');

  @override
  Widget build(BuildContext context) {
    final profileObj = ProfileDetails(
      name: favouriteProfile.name,
      profileUrl: favouriteProfile.profileUrl,
      country: favouriteProfile.country,
      state: favouriteProfile.state,
      uuid: favouriteProfile.uuid,
      national: favouriteProfile.national,
      email: favouriteProfile.email,
    );

    return Dismissible(
      key: key!,
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        child: const Align(
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      onDismissed: onDismissedCallBack,
      child: GestureDetector(
        onTap: () => pushNamed(
          ProfileDetailsPage.profileDetailsPageRoute,
          arguments: profileObj,
        ),
        child: Container(
          color: Colors.transparent,
          height: 75,
          child: Row(children: [
            AvatarWidget(
              profileDetails: profileObj,
              isAbleToRoute: false,
            ),
            Expanded(child: Text(favouriteProfile.name)),
          ]),
        ),
      ),
    );
  }
}
