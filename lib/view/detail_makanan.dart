// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:foodapp_new/model/mark.dart';
import 'package:foodapp_new/model/meals.dart';
import 'package:foodapp_new/view_model/database.dart';
import 'package:foodapp_new/view_model/fetch_meals.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:food/app/data/makanan.dart';

class DetailMakanan extends StatelessWidget {
  final Meals food;
  DetailMakanan({Key? key, required this.food});

  Repository repo = Repository();

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Chicken Dish',
            style:
                GoogleFonts.manrope(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          centerTitle: true,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder(
              future: repo.fetchData(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          Container(
                            height: 400,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(food.strMealThumb))),
                          ),
                          Container(
                            padding: EdgeInsets.all(12),
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Food Name',
                                  style: GoogleFonts.manrope(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  food.strMeal,
                                  style: GoogleFonts.manrope(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              final newbk = MyMeals(
                                  idMeal: food.idMeal,
                                  strMeal: food.strMeal,
                                  strMealThumb: food.strMealThumb);

                              await Nyarap().insert(newbk);
                              print('masuk');
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text('This food has been saved')));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 52,
                              margin:
                                  EdgeInsets.only(top: 16, right: 60, left: 60),
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Add to Bookmark',
                                    style: GoogleFonts.manrope(fontSize: 18),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Icon(Icons.star),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ));
  }
}
