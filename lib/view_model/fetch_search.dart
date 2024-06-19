import 'dart:convert';
import 'package:foodapp_new/model/mealByName.dart';
import 'package:http/http.dart' as http;

class Searcher {
  Future<List<MealByName>> searchMealsByName(String query) async {
    final url = 'https://www.themealdb.com/api/json/v1/1/search.php?s=$query';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> listJson = json.decode(response.body)["meals"];
      if (listJson != null) {
        return listJson.map((e) => MealByName.fromJson(e)).toList();
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load meals');
    }
  }
}
