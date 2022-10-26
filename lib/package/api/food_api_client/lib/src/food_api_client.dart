import 'package:dio/dio.dart';
import 'package:food_api/food_api.dart';
import 'package:food_api_client/models/food.dart';

class FoodApiClient implements FoodApi {
  @override
  Future<Food?> listFood() async {
    try {
      Response responseAPI = await Dio()
          .get('https://www.themealdb.com/api/json/v1/1/filter.php?a=italian');

      var data = responseAPI.data;
      var map = Map<String, dynamic>.from(data);
      var result = Food.fromJson(map);
      print(result);
      return result;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }
}
