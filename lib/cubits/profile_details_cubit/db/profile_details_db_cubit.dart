import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      var result = profileBox.put(profileDetails.uuid, profileDetails);
      print(result);

      // if (result) {
      //   emit(const ProfileDetailsDbStateSaveSuccessful());
      // } else {
      //   emit(const ProfileDetailsDbStateSaveFail());
      // }

      return;
    } catch (e) {
      print('Error: ${e.toString()}');

      emit(const ProfileDetailsDbStateError());
    }
  }
}
