import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_api_client/models/food.dart';
import 'package:repository/repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required FoodRespository foodRespository})
      : _foodRespository = foodRespository,
        super(const HomeState()) {
    on<HomeEventStarted>(mapEventToState);
  }
  final FoodRespository _foodRespository;

  Future<void> mapEventToState(HomeEvent event, Emitter<HomeState> emit) async {
    try {
      final listFood = await _foodRespository.listFood();
      emit(HomeState(food: listFood, status: HomeStatus.success));
    } on Exception catch (e) {
      emit(state.copyWith(message: e.toString(), status: HomeStatus.failure));
    }
  }
}
