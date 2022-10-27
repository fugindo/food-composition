import 'package:flutter_test/flutter_test.dart';
import 'package:food_api_client/food_api_client.dart';
import 'package:food_api_client/models/food.dart';
import 'package:mocktail/mocktail.dart';
import 'package:repository/repository.dart';

class MockFoodRepositoryClient extends Mock implements FoodApiClient {}

class FakeFood extends Fake implements Food {}

void main() {
  group('Food Repository', () {
    final apiClient = MockFoodRepositoryClient();
    final repository = FoodRespository(foodApiClient: apiClient);

    test('list food exception', () async {
      when(() => repository.mealsDetails(id: any(named: '12122')))
          .thenThrow(Exception('someting wrong'));
      expect(() async => repository.mealsDetails(id: 12345),
          throwsA(isA<MealsDetailsException>()));
    });
  });
}
