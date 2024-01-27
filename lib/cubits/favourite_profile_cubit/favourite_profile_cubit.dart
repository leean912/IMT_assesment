import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_profile_demo/models/profile_details.dart';
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
      final list = profileBox.values;
      print("list: $list");


    } catch (e) {
      print('Error: ${e.toString()}');

      emit(FavouriteProfileStateError());
    }

    emit(FavouriteProfileStateError());
  }
}
