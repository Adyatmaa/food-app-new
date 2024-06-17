import 'dart:convert';
import 'package:foodapp_new/model/mealByName.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class Rnd {
  final String apiUrl =
      'https://www.themealdb.com/api/json/v1/1/random.php';

  Future<List<MealByName>> fetchData() async {
    Response response = await http.get(Uri.parse(apiUrl));
    List<MealByName> mealsData;

    if (response.statusCode == 200) {
      List<dynamic> listJson = json.decode(response.body)["meals"];
      mealsData = listJson.map((e) => MealByName.fromJson(e)).toList();

      print(mealsData);
      return mealsData;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
