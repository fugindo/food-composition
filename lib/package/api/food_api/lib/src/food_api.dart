import 'package:food_api_client/models/food.dart';

abstract class FoodApi {
  Future<Food?> listFood();
}
