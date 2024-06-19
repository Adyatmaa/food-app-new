class MyMeals {
  final String idMeal;
  final String strMeal;
  final String strCategory;
  final String strArea;
  final String strInstructions;
  final String strMealThumb;

  MyMeals({
    required this.idMeal,
    required this.strMeal,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    required this.strMealThumb,
  });

  Map<String, dynamic> toMap() => {
        "id": idMeal,
        "name": strMeal,
        "category": strCategory,
        "area": strArea,
        "resep": strInstructions,
        "foto": strMealThumb,
      };
}
