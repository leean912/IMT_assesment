import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_profile_demo/components/home/avatar_widget.dart';
import 'package:flutter_profile_demo/cubits/favourite_profile_cubit/db/favourite_profile_db_cubit.dart';
import 'package:flutter_profile_demo/cubits/favourite_profile_cubit/favourite_profile_cubit.dart';
import 'package:flutter_profile_demo/models/profile_details.dart';
import 'package:flutter_profile_demo/utils/alert.dart';

class FavouriteProfilePage extends StatefulWidget {
  static const favouriteProfilePageRoute = '/favouriteProfilePageRoute';

  const FavouriteProfilePage({super.key});

  @override
  State<FavouriteProfilePage> createState() => _FavouriteProfilePageState();
}

class _FavouriteProfilePageState extends State<FavouriteProfilePage> {
  late FavouriteProfileCubit _favouriteProfileCubit;
  late FavouriteProfileDbCubit _favouriteProfileDbCubit;

  @override
  void initState() {
    super.initState();

    _favouriteProfileCubit = FavouriteProfileCubit.initial();
    _favouriteProfileDbCubit = FavouriteProfileDbCubit.initial();

    _favouriteProfileCubit.getFavouriteUserProfileList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavouriteProfileDbCubit, FavouriteProfileDbState>(
      bloc: _favouriteProfileDbCubit,
      listener: (context, state) {
        if (state is FavouriteProfileDbStateDeleteSuccessful) {
          showSnackBarWithText(context, 'Item deleted');
        }

        if (state is FavouriteProfileDbStateDeleteFail) {
          showSnackBarWithText(context, 'Item failt to delete');
        }
      },
      child: BlocBuilder<FavouriteProfileCubit, FavouriteProfileState>(
        bloc: _favouriteProfileCubit,
        builder: (context, favouriteProfileState) {
          final favouriteList = favouriteProfileState.favouriteProfileList;

          return favouriteList.isEmpty
              ? const Center(child: Text('Your favorite list is empty'))
              : ListView.builder(
                  itemCount: favouriteList.length,
                  itemBuilder: ((context, index) {
                    final favouriteProfile = favouriteList[index];

                    return Dismissible(
                      key: Key(favouriteProfile.name),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onDismissed: (direction) {
                        _favouriteProfileDbCubit.deleteFavouriteProfile(
                          favouriteProfile,
                          _favouriteProfileCubit,
                        );
                      },
                      child: SizedBox(
                        height: 75,
                        child: Row(children: [
                          AvatarWidget(
                            profileDetails: ProfileDetails(
                              name: favouriteProfile.name,
                              profileUrl: favouriteProfile.profileUrl,
                              country: favouriteProfile.country,
                              state: favouriteProfile.state,
                              uuid: favouriteProfile.uuid,
                              national: favouriteProfile.national,
                            ),
                          ),
                          Expanded(child: Text(favouriteProfile.name)),
                        ]),
                      ),
                    );
                  }),
                );
        },
      ),
    );
  }
}
