import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        title: const Text('HOME'),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
          bloc: _homeCubit,
          builder: (context, snapshot) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[],
              ),
            );
          }),
    );
  }
}
