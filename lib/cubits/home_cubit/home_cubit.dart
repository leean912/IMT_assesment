import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_profile_demo/models/profile_details.dart';
import 'package:flutter_profile_demo/repositories/profile_service_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit._({HomeState? state}) : super(state ?? HomeStateInitial());

  factory HomeCubit.initial({HomeState? state}) {
    return HomeCubit._(state: state);
  }

  Future<void> getUserProfileList() async {
    emit(HomeStateLoading());

    try {
      final response = await ProfileServiceRepository().getProfileList();

      if (response != null) {
        List<dynamic> decodedRes = (jsonDecode(response.toString()) as Map<String, dynamic>)["results"];

        List<ProfileDetails> userFromUSList = decodedRes
            .asMap()
            .entries
            .map((e) => ProfileDetails.fromJson(
                  response: e.value,
                ))
            .toList();

        List<ProfileDetails> userAwayUSList = decodedRes
            .asMap()
            .entries
            .map((e) => ProfileDetails.fromJson(
                  response: e.value,
                  isUS: false,
                ))
            .toList();

        userFromUSList.removeWhere((element) => element.name == null);
        userAwayUSList.removeWhere((element) => element.name == null);

        emit(HomeStateLoaded(
          newUserListFromUS: userFromUSList,
          newUserListAwayUS: userAwayUSList,
        ));

        return;
      }
    } catch (e) {
      debugPrint('Error: ${e.toString()}');

      emit(HomeStateError());
    }
  }
}
