import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_profile_demo/cubits/home_cubit/home_state.dart';
import 'package:flutter_profile_demo/repositories/profile_service_repository.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit._({HomeState? state}) : super(state ?? HomeState());

  Future<void> getUserProfileList() async {
    final response = await ProfileServiceRepository().getProfileList();
    print(response);
  }

  factory HomeCubit.initial({HomeState? state}) {
    return HomeCubit._(state: state);
  }
}
