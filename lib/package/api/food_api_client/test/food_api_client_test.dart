import 'package:flutter_test/flutter_test.dart';
import 'package:food_api_client/food_api_client.dart';

void main() {
  test('adds one to input values', () async {
    final data = FoodApiClient();

    var result = await data.mealsDetails(id: 53014);
    print('INI YANG MANA>> $result');
  });
}
