part of 'profile_details_cubit.dart';

abstract class ProfileDetailsState extends Equatable {
  final bool isFavourited;

  const ProfileDetailsState({required this.isFavourited});

  @override
  List<Object?> get props => [isFavourited];
}

class ProfileDetailsStateInitial extends ProfileDetailsState {
  const ProfileDetailsStateInitial() : super(isFavourited: false);
}

class ProfileDetailsStateLoading extends ProfileDetailsState {
  const ProfileDetailsStateLoading() : super(isFavourited: false);
}

class ProfileDetailsStateLoaded extends ProfileDetailsState {
  final bool newIsFavourited;

  const ProfileDetailsStateLoaded({
    required this.newIsFavourited,
  }) : super(
          isFavourited: newIsFavourited,
        );

  @override
  List<Object?> get props => [newIsFavourited];
}

class ProfileDetailsStateError extends ProfileDetailsState {
  const ProfileDetailsStateError() : super(isFavourited: false);
}
