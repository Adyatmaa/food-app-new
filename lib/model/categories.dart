import 'dart:convert';

Categories categoriesFromJson(String str) => Categories.fromJson(json.decode(str));

String categoriesToJson(Categories data) => json.encode(data.toJson());

class Categories {
    final dynamic idCategory;
    final String strCategory;
    final String strCategoryThumb;
    final String strCategoryDescription;

    Categories({
        required this.idCategory,
        required this.strCategory,
        required this.strCategoryThumb,
        required this.strCategoryDescription,
    });

    factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        idCategory: json["idCategory"],
        strCategory: json["strCategory"],
        strCategoryThumb: json["strCategoryThumb"],
        strCategoryDescription: json["strCategoryDescription"],
    );

    Map<String, dynamic> toJson() => {
        "idCategory": idCategory,
        "strCategory": strCategory,
        "strCategoryThumb": strCategoryThumb,
        "strCategoryDescription": strCategoryDescription,
    };
}
