import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_profile_demo/repositories/profile_service_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit._({HomeState? state}) : super(state ?? HomeStateInitial());

  factory HomeCubit.initial({HomeState? state}) {
    return HomeCubit._(state: state);
  }

  Future<void> getUserProfileList() async {
    if (state is! HomeStateInitial) {
      return;
    }

    emit(HomeStateLoading());

    final response = await ProfileServiceRepository().getProfileList();

    if (response != null) {
      emit(HomeStateLoaded(newUserList: jsonDecode(response.toString())["results"]));
      return;
    }

    emit(HomeStateError());
  }
}
