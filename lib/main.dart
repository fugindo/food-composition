import 'package:flutter/material.dart';
import 'package:food_api_client/food_api_client.dart';
import 'package:food_composition/app/app.dart';
import 'package:repository/repository.dart';

void main() {
  final apiClient = FoodApiClient();
  final foodRepository = FoodRespository(foodApiClient: apiClient);

  final app = App(foodRespository: foodRepository);
  runApp(app);
}
