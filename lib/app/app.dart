import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_composition/home/bloc/home_bloc/home_bloc.dart';
import 'package:food_composition/home/view/dashboard.dart';
import 'package:repository/repository.dart';

class App extends StatelessWidget {
  const App({super.key, required FoodRespository foodRespository})
      : _foodRespository = foodRespository;
  final FoodRespository _foodRespository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _foodRespository),
      ],
      child: MultiBlocProvider(
          providers: [
            BlocProvider<HomeBloc>(
                lazy: false,
                create: (context) => HomeBloc(foodRespository: _foodRespository)
                  ..add(HomeEventStarted())),
            
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'List Food',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const DashboardView(),
          )),
    );
  }
}
