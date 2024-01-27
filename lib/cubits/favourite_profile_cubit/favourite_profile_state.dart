part of 'favourite_profile_cubit.dart';

abstract class FavouriteProfileState extends Equatable {
  final List<ProfileDetailsDb> favouriteProfileList;

  const FavouriteProfileState({required this.favouriteProfileList});

  @override
  List<Object?> get props => [favouriteProfileList];
}

class FavouriteProfileStateInitial extends FavouriteProfileState {
  FavouriteProfileStateInitial() : super(favouriteProfileList: []);
}

class FavouriteProfileStateLoading extends FavouriteProfileState {
  FavouriteProfileStateLoading() : super(favouriteProfileList: []);
}

class FavouriteProfileStateLoaded extends FavouriteProfileState {
  final List<ProfileDetailsDb> newFavouriteProfileList;

  const FavouriteProfileStateLoaded({
    required this.newFavouriteProfileList,
  }) : super(
          favouriteProfileList: newFavouriteProfileList,
        );

  @override
  List<Object?> get props => [newFavouriteProfileList];
}

class FavouriteProfileStateError extends FavouriteProfileState {
  FavouriteProfileStateError() : super(favouriteProfileList: []);
}
