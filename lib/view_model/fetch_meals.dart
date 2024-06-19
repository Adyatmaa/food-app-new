import 'dart:convert';
import 'package:foodapp_new/model/meals.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class Repository {
  Future<List<Meals>> fetchData(String query) async {
    final String api =
        'https://www.themealdb.com/api/json/v1/1/filter.php?c=$query';

    Response response = await http.get(Uri.parse(api));
    List<Meals> mealsData;

    if (response.statusCode == 200) {
      List<dynamic> listJson = json.decode(response.body)["meals"];
      mealsData = listJson.map((e) => Meals.fromJson(e)).toList();

      print(mealsData);
      return mealsData;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
