import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_profile_demo/db_model/profile_details_db.dart';
import 'package:flutter_profile_demo/models/profile_details.dart';
import 'package:flutter_profile_demo/service_locator.dart';
import 'package:hive/hive.dart';

part 'profile_details_db_state.dart';

class ProfileDetailsDbCubit extends Cubit<ProfileDetailsDbState> {
  final Box profileBox;

  ProfileDetailsDbCubit._({ProfileDetailsDbState? state})
      : profileBox = sl.get<Box>(),
        super(state ?? const ProfileDetailsDbStateInitial());

  factory ProfileDetailsDbCubit.initial({ProfileDetailsDbState? state}) {
    return ProfileDetailsDbCubit._(state: state);
  }

  Future<void> saveFavourite(ProfileDetails profileDetails) async {
    try {
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

      emit(const ProfileDetailsDbStateSaveSuccessful());
      return;
    } catch (e) {
      print('Error: ${e.toString()}');

      emit(const ProfileDetailsDbStateError());
    }
  }
}
