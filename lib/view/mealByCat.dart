import 'package:flutter/material.dart';
import 'package:foodapp_new/model/meals.dart';
import 'package:foodapp_new/view/home.dart';
import 'package:foodapp_new/view_model/fetch_meals.dart';
import 'package:google_fonts/google_fonts.dart';

class MealByCat extends StatelessWidget {
  final String mealsByCat;
  MealByCat({Key? key, required this.mealsByCat});

  late Future<List<Meals>> fooddss;
  Repository repo = Repository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          mealsByCat,
          style: GoogleFonts.manrope(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: FutureBuilder(
          future: repo.fetchData(mealsByCat),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error while displaying data'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Text('There is nothing in here'),
              );
            } else {
              return Container(
                  child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 205,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var mls = snapshot.data![index];
                  return Container(
                    height: 450,
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all()),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(6),
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(mls.strMealThumb))),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            textAlign: TextAlign.center,
                            mls.strMeal,
                            style: GoogleFonts.manrope(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ));
            }
          },
        ),
      ),
    );
  }
}
