part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  final List<ProfileDetails> userListFromUS;
  final List<ProfileDetails> userListAwayUS;

  const HomeState({
    required this.userListFromUS,
    required this.userListAwayUS,
  });

  @override
  List<Object?> get props => [
        userListFromUS,
        userListAwayUS,
      ];
}

class HomeStateInitial extends HomeState {
  HomeStateInitial()
      : super(
          userListFromUS: [],
          userListAwayUS: [],
        );
}

class HomeStateLoading extends HomeState {
  HomeStateLoading()
      : super(
          userListFromUS: [],
          userListAwayUS: [],
        );
}

class HomeStateLoaded extends HomeState {
  final List<ProfileDetails> newUserListFromUS;
  final List<ProfileDetails> newUserListAwayUS;

  const HomeStateLoaded({
    required this.newUserListFromUS,
    required this.newUserListAwayUS,
  }) : super(
          userListFromUS: newUserListFromUS,
          userListAwayUS: newUserListAwayUS,
        );

  @override
  List<Object?> get props => [
        newUserListFromUS,
        newUserListAwayUS,
      ];
}

class HomeStateError extends HomeState {
  HomeStateError()
      : super(
          userListFromUS: [],
          userListAwayUS: [],
        );
}
