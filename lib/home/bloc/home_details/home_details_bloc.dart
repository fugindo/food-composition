import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_details_event.dart';
part 'home_details_state.dart';

class HomeDetailsBloc extends Bloc<HomeDetailsEvent, HomeDetailsState> {
  HomeDetailsBloc() : super(HomeDetailsInitial()) {
    on<HomeDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
