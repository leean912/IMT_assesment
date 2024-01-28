import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_profile_demo/components/profile_details_page/avatar_favourite_widget.dart';
import 'package:flutter_profile_demo/cubits/profile_details_cubit/db/profile_details_db_cubit.dart';
import 'package:flutter_profile_demo/cubits/profile_details_cubit/profile_details_cubit.dart';
import 'package:flutter_profile_demo/models/profile_details.dart';
import 'package:flutter_profile_demo/services/navigation_service.dart';
import 'package:flutter_profile_demo/utils/alert.dart';

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

  late ProfileDetailsCubit _profileDetailsCubit;
  late ProfileDetailsDbCubit _profileDetailsDbCubit;

  @override
  void initState() {
    super.initState();

    _profileDetails = widget.profileDetails;

    _profileDetailsCubit = ProfileDetailsCubit.initial();
    _profileDetailsDbCubit = ProfileDetailsDbCubit.initial();

    _profileDetailsCubit.getIsFavourited(_profileDetails!.uuid!);
  }

  @override
  Widget build(BuildContext context) {
    const titleFontWeight = FontWeight.bold;

    return BlocListener<ProfileDetailsDbCubit, ProfileDetailsDbState>(
      bloc: _profileDetailsDbCubit,
      listener: (context, profileDetailsDbState) {
        if (profileDetailsDbState is ProfileDetailsDbStateSaveSuccessful) {
          showSnackBarWithText(context, 'User saved');
        }

        if (profileDetailsDbState is ProfileDetailsDbStateSaveFail) {
          showSnackBarWithText(context, 'Fail to save user');
        }

        if (profileDetailsDbState is ProfileDetailsDbStateRemoveSuccessful) {
          showSnackBarWithText(context, 'User removed');
        }
      },
      child: Scaffold(
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
                BlocBuilder<ProfileDetailsCubit, ProfileDetailsState>(
                  bloc: _profileDetailsCubit,
                  builder: (context, profileDetailsState) {
                    return AvatarFavouriteWidget(
                      profileDetails: _profileDetails!,
                      favouriteFunction: () =>
                          _profileDetailsDbCubit.saveFavourite(_profileDetailsCubit, _profileDetails!),
                      isFavourited: profileDetailsState.isFavourited,
                    );
                  },
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
          )),
    );
  }
}
