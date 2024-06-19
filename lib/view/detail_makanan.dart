import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:foodapp_new/model/mark.dart';
import 'package:foodapp_new/model/mealByName.dart';
import 'package:foodapp_new/view_model/database.dart';
import 'package:foodapp_new/view_model/fetch_random.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:food/app/data/makanan.dart';

class DetailMakanan extends StatelessWidget {
  final MealByName food;
  DetailMakanan({Key? key, required this.food});

  Rnd rnd = Rnd();

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '',
            style:
                GoogleFonts.manrope(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          centerTitle: true,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder(
              future: rnd.fetchData(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
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
                                  food.strMeal,
                                  style: GoogleFonts.manrope(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  food.strMeal +
                                      ' is a ' +
                                      food.strArea +
                                      ' ' +
                                      food.strCategory,
                                  style: GoogleFonts.manrope(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  'Here is how to cook ' + food.strMeal,
                                  style: GoogleFonts.manrope(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  food.strInstructions,
                                  style: GoogleFonts.manrope(),
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
