part of 'favourite_profile_db_cubit.dart';

abstract class FavouriteProfileDbState extends Equatable {
  const FavouriteProfileDbState();

  @override
  List<Object?> get props => [];
}

class FavouriteProfileDbStateInitial extends FavouriteProfileDbState {
  const FavouriteProfileDbStateInitial();
}

class FavouriteProfileDbStateDeleteLoading extends FavouriteProfileDbState {
  const FavouriteProfileDbStateDeleteLoading();
}

class FavouriteProfileDbStateDeleteSuccessful extends FavouriteProfileDbState {
  const FavouriteProfileDbStateDeleteSuccessful();
}

class FavouriteProfileDbStateDeleteFail extends FavouriteProfileDbState {
  const FavouriteProfileDbStateDeleteFail();
}
