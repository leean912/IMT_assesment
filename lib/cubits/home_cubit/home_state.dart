part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  final List<dynamic> userList;

  const HomeState({
    required this.userList,
  });

  @override
  List<Object?> get props => [
        userList,
      ];
}

class HomeStateInitial extends HomeState {
  HomeStateInitial() : super(userList: []);
}

class HomeStateLoading extends HomeState {
  HomeStateLoading() : super(userList: []);
}

class HomeStateLoaded extends HomeState {
  final List<dynamic> newUserList;

  const HomeStateLoaded({
    required this.newUserList,
  }) : super(userList: newUserList);

  @override
  List<Object?> get props => [
        userList,
      ];
}

class HomeStateError extends HomeState {
  HomeStateError() : super(userList: []);
}
