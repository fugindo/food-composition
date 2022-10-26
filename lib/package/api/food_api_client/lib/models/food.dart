import 'package:food_api_client/models/meals.dart';

class Food {
  Food({
    this.meals,
  });

  final List<Meal>? meals;

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meals": List<dynamic>.from(meals!.map((x) => x.toJson())),
      };
}
