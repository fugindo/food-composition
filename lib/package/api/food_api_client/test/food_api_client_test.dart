import 'package:flutter_test/flutter_test.dart';
import 'package:food_api_client/food_api_client.dart';

void main() {
  test('adds one to input values', () async {
    final data = FoodApiClient();

    var result = await data.listFood();
  });
}
