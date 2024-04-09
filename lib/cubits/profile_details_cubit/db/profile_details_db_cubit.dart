import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_profile_demo/cubits/profile_details_cubit/profile_details_cubit.dart';
import 'package:flutter_profile_demo/db_model/profile_details_db.dart';
import 'package:flutter_profile_demo/models/profile_details.dart';
import 'package:flutter_profile_demo/service_locator.dart';
import 'package:hive/hive.dart';

part 'profile_details_db_state.dart';

class ProfileDetailsDbCubit extends Cubit<ProfileDetailsDbState> {
  final Box profileBox;

  ProfileDetailsDbCubit._({ProfileDetailsDbState? state})
      : profileBox = sl.get<Box<ProfileDetailsDb>>(),
        super(state ?? const ProfileDetailsDbStateInitial());

  factory ProfileDetailsDbCubit.initial({ProfileDetailsDbState? state}) {
    return ProfileDetailsDbCubit._(state: state);
  }

  Future<void> saveFavourite(
    ProfileDetailsCubit profileDetailsCubit,
    ProfileDetails profileDetails,
  ) async {
    emit(const ProfileDetailsDbStateLoading());

    try {
      var result = profileBox.get(profileDetails.uuid);

      if (result != null) {
        await profileBox.delete(profileDetails.uuid!);

        profileDetailsCubit.changeFavouriteState(false);

        emit(const ProfileDetailsDbStateRemoveSuccessful());

        return;
      }

      await profileBox
          .put(
        profileDetails.uuid,
        ProfileDetailsDb(
          name: profileDetails.name!,
          profileUrl: profileDetails.profileUrl!,
          email: profileDetails.email!,
          country: profileDetails.country!,
          state: profileDetails.state!,
          uuid: profileDetails.uuid!,
          national: profileDetails.national!,
        ),
      )
          .catchError((onError) {
        emit(const ProfileDetailsDbStateSaveFail());

        return;
      });
      profileDetailsCubit.changeFavouriteState(true);

      emit(const ProfileDetailsDbStateSaveSuccessful());
      return;
    } catch (e) {
      debugPrint('Error: ${e.toString()}');

      emit(const ProfileDetailsDbStateError());
    }
  }
}
