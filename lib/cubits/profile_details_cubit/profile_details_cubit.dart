import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_profile_demo/db_model/profile_details_db.dart';
import 'package:flutter_profile_demo/service_locator.dart';
import 'package:hive/hive.dart';

part 'profile_details_state.dart';

class ProfileDetailsCubit extends Cubit<ProfileDetailsState> {
  final Box profileBox;

  ProfileDetailsCubit._({ProfileDetailsState? state})
      : profileBox = sl.get<Box<ProfileDetailsDb>>(),
        super(state ?? const ProfileDetailsStateInitial());

  factory ProfileDetailsCubit.initial({ProfileDetailsState? state}) {
    return ProfileDetailsCubit._(state: state);
  }

  Future<void> getIsFavourited(String uuid) async {
    emit(const ProfileDetailsStateLoading());

    try {
      var result = profileBox.get(uuid);

      if (result == null) {
        emit(const ProfileDetailsStateLoaded(newIsFavourited: false));
      } else {
        emit(const ProfileDetailsStateLoaded(newIsFavourited: true));
      }

      return;
    } catch (e) {
      debugPrint('Error: ${e.toString()}');

      emit(const ProfileDetailsStateError());
    }
  }

  void changeFavouriteState(bool isSuccessSave) {
    emit(ProfileDetailsStateLoaded(newIsFavourited: isSuccessSave));
  }
}
