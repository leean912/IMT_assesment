import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_profile_demo/cubits/home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit._({HomeState? state}) : super(state ?? HomeState());
}
