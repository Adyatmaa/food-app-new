import 'dart:convert';

Meals mealsFromJson(String str) => Meals.fromJson(json.decode(str));

String mealsToJson(Meals data) => json.encode(data.toJson());

class Meals {
    final String strMeal;
    final String strMealThumb;
    final String idMeal;

    Meals({
        required this.strMeal,
        required this.strMealThumb,
        required this.idMeal,
    });

    factory Meals.fromJson(Map<String, dynamic> json) => Meals(
        strMeal: json["strMeal"],
        strMealThumb: json["strMealThumb"],
        idMeal: json["idMeal"],
    );

    Map<String, dynamic> toJson() => {
        "strMeal": strMeal,
        "strMealThumb": strMealThumb,
        "idMeal": idMeal,
    };
}
