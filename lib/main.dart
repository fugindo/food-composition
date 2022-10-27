import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_api_client/food_api_client.dart';
import 'package:food_composition/app/app.dart';
import 'package:food_composition/utils/debugger.dart';
import 'package:repository/repository.dart';

void main() {

  Bloc.observer = GlobalObserver();
  final apiClient = FoodApiClient();
  final foodRepository = FoodRespository(foodApiClient: apiClient);

  final app = App(foodRespository: foodRepository);
  runApp(app);
}
