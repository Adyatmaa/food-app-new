import 'dart:convert';
import 'package:foodapp_new/model/categories.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class Cat {
  final String apiUrl =
      'https://www.themealdb.com/api/json/v1/1/categories.php';

  Future<List<Categories>> fetchData() async {
    Response response = await http.get(Uri.parse(apiUrl));
    List<Categories> mealsData;

    if (response.statusCode == 200) {
      List<dynamic> listJson = json.decode(response.body)["categories"];
      mealsData = listJson.map((e) => Categories.fromJson(e)).toList();

      print(mealsData);
      return mealsData;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
