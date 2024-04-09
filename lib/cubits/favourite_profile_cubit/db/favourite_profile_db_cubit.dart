import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_profile_demo/cubits/favourite_profile_cubit/favourite_profile_cubit.dart';
import 'package:flutter_profile_demo/db_model/profile_details_db.dart';
import 'package:flutter_profile_demo/service_locator.dart';
import 'package:hive/hive.dart';

part 'favourite_profile_db_state.dart';

class FavouriteProfileDbCubit extends Cubit<FavouriteProfileDbState> {
  final Box profileBox;

  FavouriteProfileDbCubit._({FavouriteProfileDbState? state})
      : profileBox = sl.get<Box<ProfileDetailsDb>>(),
        super(state ?? const FavouriteProfileDbStateInitial());

  factory FavouriteProfileDbCubit.initial({FavouriteProfileDbState? state}) {
    return FavouriteProfileDbCubit._(state: state);
  }

  Future<void> deleteFavouriteProfile(
    ProfileDetailsDb profileDetails,
    FavouriteProfileCubit favouriteProfileCubit,
  ) async {
    emit(const FavouriteProfileDbStateDeleteLoading());

    try {
      await profileBox.delete(profileDetails.uuid).catchError((onError) {
        emit(const FavouriteProfileDbStateDeleteFail());

        return;
      });

      emit(const FavouriteProfileDbStateDeleteSuccessful());

      favouriteProfileCubit.getFavouriteUserProfileList();
    } catch (e) {
      debugPrint('Error: ${e.toString()}');

      emit(const FavouriteProfileDbStateDeleteFail());
    }
  }
}
