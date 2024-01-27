import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_profile_demo/components/home/avatar_list_widget.dart';
import 'package:flutter_profile_demo/cubits/home_cubit/home_cubit.dart';

class HomePage extends StatefulWidget {
  static const myHomePageroute = '/myHomePageroute';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeCubit _homeCubit;

  @override
  void initState() {
    super.initState();

    _homeCubit = HomeCubit.initial(state: HomeStateInitial());

    _homeCubit.getUserProfileList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('HOME'),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
          bloc: _homeCubit,
          builder: (context, homeState) {
            const titleTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 17);

            const textPadiing = EdgeInsets.symmetric(vertical: 15);

            final userFromUSList = homeState.userListFromUS;
            final userAwayUSList = homeState.userListAwayUS;

            bool isHidden = userFromUSList.isEmpty;

            return Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (!isHidden)
                      const Padding(
                        padding: textPadiing,
                        child: Text(
                          'From US',
                          style: titleTextStyle,
                        ),
                      ),
                    if (!isHidden)
                      AvatarListWidget(
                        profileDetailsList: userFromUSList,
                      ),
                    const Padding(
                      padding: textPadiing,
                      child: Text(
                        'Other Countries',
                        style: titleTextStyle,
                      ),
                    ),
                    AvatarListWidget(
                      profileDetailsList: userAwayUSList,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
