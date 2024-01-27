import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_profile_demo/components/home/avatar_widget.dart';
import 'package:flutter_profile_demo/cubits/favourite_profile_cubit/favourite_profile_cubit.dart';

class FavouriteProfilePage extends StatefulWidget {
  static const favouriteProfilePageRoute = '/favouriteProfilePageRoute';

  const FavouriteProfilePage({super.key});

  @override
  State<FavouriteProfilePage> createState() => _FavouriteProfilePageState();
}

class _FavouriteProfilePageState extends State<FavouriteProfilePage> {
  late FavouriteProfileCubit _favouriteProfileCubit;

  @override
  void initState() {
    super.initState();

    _favouriteProfileCubit = FavouriteProfileCubit.initial();

    _favouriteProfileCubit.getFavouriteUserProfileList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteProfileCubit, FavouriteProfileState>(
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
                    key: Key(favouriteProfile.uuid!),
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
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Item deleted'),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: AvatarWidget(
                        profileDetails: favouriteProfile,
                        width: 51,
                        height: 51,
                      ),
                      title: Text('${favouriteProfile.name}'),
                    ),
                  );
                }),
              );
      },
    );
  }
}
