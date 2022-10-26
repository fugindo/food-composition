import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_composition/home/bloc/home_bloc/home_bloc.dart';
import 'package:food_composition/home/bloc/home_details/home_details_bloc.dart';
import 'package:food_composition/home/view/dashboard.dart';
import 'package:repository/repository.dart';

class App extends StatelessWidget {
  const App({super.key, required FoodRespository foodRespository})
      : _foodRespository = foodRespository;
  final FoodRespository _foodRespository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => RepositoryProvider.value(value: _foodRespository),
      child: MultiBlocProvider(providers: [
        BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => HomeDetailsBloc())
      ], child: const AppView()),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List Food',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const DashboardView(),
    );
  }
}
