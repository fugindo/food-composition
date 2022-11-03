import 'package:dio/dio.dart';
import 'package:food_api/food_api.dart';
import 'package:food_api_client/models/food.dart';
import 'package:food_api_client/models/meals.dart';

class FoodApiClient implements FoodApi {
  @override
  Future<Food?> listFood() async {
    try {
      Response responseAPI = await Dio()
          .get('https://www.themealdb.com/api/json/v1/1/filter.php?a=italian');

      var data = responseAPI.data;
      var map = Map<String, dynamic>.from(data);
      var result = Food.fromJson(map);

      return result;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Meals?> mealsDetails({required int? id}) async {
    try {
      Response response = await Dio().getUri(Uri.parse(
          'https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id'));
      var data = response.data;

      var map = Map<String, dynamic>.from(data);

      var result = Meals.fromJson(map);

      return result;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }
}
