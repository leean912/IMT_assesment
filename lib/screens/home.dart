import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_profile_demo/cubits/home_cubit/home_cubit.dart';
import 'package:flutter_profile_demo/cubits/home_cubit/home_state.dart';

class MyHomePage extends StatefulWidget {
  static const myHomePageroute = '/myHomePageroute';

  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late HomeCubit _homeCubit;

  @override
  void initState() {
    super.initState();

    _homeCubit = HomeCubit.initial();

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
