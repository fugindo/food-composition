part of 'home_details_bloc.dart';

enum HomeDetailsStatus { initial, success, failure }

class HomeDetailsState extends Equatable {
  const HomeDetailsState(
      {this.meals,
      this.status = HomeDetailsStatus.initial,
      this.message = 'Something Error',
      this.id});
  final Meals? meals;
  final HomeDetailsStatus status;
  final String? message;
  final String? id;
  HomeDetailsState copyWith(
      {Meals? meals, HomeDetailsStatus? status, String? message, String? id}) {
    return HomeDetailsState(
        meals: meals ?? this.meals,
        status: status ?? this.status,
        message: message ?? this.message,
        id: id ?? this.id);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [meals, status, message, id];
}
