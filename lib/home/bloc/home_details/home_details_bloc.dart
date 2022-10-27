import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_api_client/models/meals.dart';
import 'package:repository/repository.dart';

part 'home_details_event.dart';
part 'home_details_state.dart';

class HomeDetailsBloc extends Bloc<HomeDetailsEventData, HomeDetailsState> {
  HomeDetailsBloc({required FoodRespository foodRespository})
      : _foodRespository = foodRespository,
        super(const HomeDetailsState()) {
    on<HomeDetailsEventData>(mapEventToState);
  }

  final FoodRespository _foodRespository;

  Future<void> mapEventToState(
      HomeDetailsEventData event, Emitter<HomeDetailsState> emit) async {
    try {
      final dataDetails = await _foodRespository.mealsDetails(id: event.id);

      emit(state.copyWith(
          meals: dataDetails, status: HomeDetailsStatus.success));
    } on Exception catch (e) {
      emit(state.copyWith(
          message: e.toString(), status: HomeDetailsStatus.failure));
    }
  }
}
