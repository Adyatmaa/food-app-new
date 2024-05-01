class MyMeals {
  final String idMeal;
  final String strMeal;
  final String strMealThumb;

  MyMeals({
    required this.idMeal,
    required this.strMeal,
    required this.strMealThumb,
  });

  Map<String, dynamic> toMap() => {
        "id": idMeal,
        "name": strMeal,
        "foto": strMealThumb,
      };

}
