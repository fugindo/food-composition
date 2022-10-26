import 'package:food_api_client/food_api_client.dart';
import 'package:food_api_client/models/food.dart';

class RepositoryException implements Exception {
  RepositoryException(this.error, this.stackTrace);
  final Exception error;

  final StackTrace stackTrace;
}

class FoodRespository implements Exception {
  FoodRespository({required FoodApiClient foodApiClient})
      : _foodApiClient = foodApiClient;
  final FoodApiClient _foodApiClient;

  Future<Food?> listFood() async {
    try {
      var data = await _foodApiClient.listFood();
      print(data);
      return data;
    } on Exception catch (error, stackTrace) {
      throw RepositoryException(error, stackTrace);
    }
  }
}
