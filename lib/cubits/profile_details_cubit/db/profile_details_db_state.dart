part of 'profile_details_db_cubit.dart';

abstract class ProfileDetailsDbState extends Equatable {
  const ProfileDetailsDbState();

  @override
  List<Object?> get props => [];
}

class ProfileDetailsDbStateInitial extends ProfileDetailsDbState {
  const ProfileDetailsDbStateInitial() : super();
}

class ProfileDetailsDbStateLoading extends ProfileDetailsDbState {
  const ProfileDetailsDbStateLoading() : super();
}

class ProfileDetailsDbStateSaveSuccessful extends ProfileDetailsDbState {
  const ProfileDetailsDbStateSaveSuccessful() : super();
}

class ProfileDetailsDbStateRemoveSuccessful extends ProfileDetailsDbState {
  const ProfileDetailsDbStateRemoveSuccessful() : super();
}

class ProfileDetailsDbStateSaveFail extends ProfileDetailsDbState {
  const ProfileDetailsDbStateSaveFail() : super();
}

class ProfileDetailsDbStateError extends ProfileDetailsDbState {
  const ProfileDetailsDbStateError() : super();
}
