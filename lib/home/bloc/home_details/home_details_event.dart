part of 'home_details_bloc.dart';

class HomeDetailsEventData extends Equatable {
  const HomeDetailsEventData({this.id});
  final int? id;
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
