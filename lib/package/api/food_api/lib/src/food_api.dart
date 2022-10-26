import 'package:food_api_client/models/food.dart';
import 'package:food_api_client/models/meals.dart';

abstract class FoodApi {
  Future<Food?> listFood();

  Future<Meals?> mealsDetails({required int? id});
}
