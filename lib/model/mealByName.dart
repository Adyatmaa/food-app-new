import 'dart:convert';

MealByName mealByNameFromJson(String str) => MealByName.fromJson(json.decode(str));

String mealByNameToJson(MealByName data) => json.encode(data.toJson());

class MealByName {
    final String idMeal;
    final String strMeal;
    final String strCategory;
    final String strArea;
    final String strInstructions;
    final String strMealThumb;
    final String strSource;

    MealByName({
        required this.idMeal,
        required this.strMeal,
        required this.strCategory,
        required this.strArea,
        required this.strInstructions,
        required this.strMealThumb,
        required this.strSource,
    });

    factory MealByName.fromJson(Map<String, dynamic> json) => MealByName(
        idMeal: json["idMeal"],
        strMeal: json["strMeal"],
        strCategory: json["strCategory"],
        strArea: json["strArea"],
        strInstructions: json["strInstructions"],
        strMealThumb: json["strMealThumb"],
        strSource: json["strSource"],
    );

    Map<String, dynamic> toJson() => {
        "idMeal": idMeal,
        "strMeal": strMeal,
        "strCategory": strCategory,
        "strArea": strArea,
        "strInstructions": strInstructions,
        "strMealThumb": strMealThumb,
        "strSource": strSource,
    };
}
