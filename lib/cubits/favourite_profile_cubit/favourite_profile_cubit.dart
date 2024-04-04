import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_profile_demo/db_model/profile_details_db.dart';
import 'package:flutter_profile_demo/service_locator.dart';
import 'package:hive/hive.dart';

part 'favourite_profile_state.dart';

class FavouriteProfileCubit extends Cubit<FavouriteProfileState> {
  final Box profileBox;

  FavouriteProfileCubit._({FavouriteProfileState? state})
      : profileBox = sl.get<Box>(),
        super(state ?? FavouriteProfileStateInitial());

  factory FavouriteProfileCubit.initial({FavouriteProfileState? state}) {
    return FavouriteProfileCubit._(state: state);
  }

  Future<void> getFavouriteUserProfileList() async {
    emit(FavouriteProfileStateLoading());

    try {
      var list = profileBox.values.toList() as List<ProfileDetailsDb>;

      emit(FavouriteProfileStateLoaded(newFavouriteProfileList: list));
    } catch (e) {
      debugPrint('Error: ${e.toString()}');

      emit(FavouriteProfileStateError());
    }
  }
}
