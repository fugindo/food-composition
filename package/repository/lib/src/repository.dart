import 'package:food_api_client/food_api_client.dart';
import 'package:food_api_client/models/food.dart';
import 'package:food_api_client/models/meals.dart';

/// {@template RepositoryException}
/// Generic [Exception] thrown by the [FoodRespository].
/// {@endtemplate}
class RepositoryException implements Exception {
  /// {@macro RepositoryException}
  RepositoryException(this.error, this.stackTrace);

  /// The [Exception] which was thrown.
  final Exception error;

  /// The full [StackTrace].
  final StackTrace stackTrace;
}

/// {@template RepositoryException}
/// Generic [Exception] thrown by the [FoodRespository].
/// {@endtemplate}
class ListFoodException extends RepositoryException {
  /// {@macro RepositoryException}
  ListFoodException(super.error, super.stackTrace);
}

/// {@template RepositoryException}
/// Generic [Exception] thrown by the [FoodRespository].
/// {@endtemplate}
class MealsDetailsException extends RepositoryException {
  /// {@macro RepositoryException}
  MealsDetailsException(super.error, super.stackTrace);
}

/// {@template RepositoryException}
/// Generic [Exception] thrown by the [FoodRespository].
/// {@endtemplate}
class FoodRespository implements Exception {
  FoodRespository({required FoodApiClient foodApiClient})
      : _foodApiClient = foodApiClient;
  final FoodApiClient _foodApiClient;

  /// List food from api
  Future<Food?> listFood() async {
    try {
      return await _foodApiClient.listFood();
    } on Exception catch (error, stackTrace) {
      throw ListFoodException(error, stackTrace);
    }
  }

  /// Meals details from api
  Future<Meals?> mealsDetails({required int id}) async {
    try {
      return await _foodApiClient.mealsDetails(id: id);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
