part of 'home_bloc.dart';

enum HomeStatus { initial, success, failure }

class HomeState extends Equatable {
  const HomeState(
      {this.food,
      this.status = HomeStatus.initial,
      this.message = 'Something Error'});
  final Food? food;
  final HomeStatus status;
  final String? message;
  HomeState copyWith({Food? food, HomeStatus? status, String? message}) {
    return HomeState(
        food: food ?? this.food,
        status: status ?? this.status,
        message: message ?? this.message);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [food, status, message];
}
