import 'package:flutter_test/flutter_test.dart';
import 'package:food_api_client/food_api_client.dart';
import 'package:repository/src/repository.dart';

void main() {
  test('adds one to input values', () async {
    final api = FoodApiClient();

    final repository = FoodRespository(foodApiClient: api);

    final data = await repository.mealsDetails(id: 52770);
    print(data?.meals?[0].strMealThumb);
  });
}
