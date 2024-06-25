import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:foodapp_new/model/mealByName.dart';
import 'package:foodapp_new/view/bookmark.dart';
import 'package:foodapp_new/view/detail_makanan.dart';
import 'package:foodapp_new/view/home.dart';
import 'package:foodapp_new/view/profile.dart';
import 'package:foodapp_new/view_model/fetch_search.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _search = TextEditingController();

  List<MealByName> _meals = [];
  final Searcher src = Searcher();
  bool tema = false;

  Future<void> _searchMeals(String query) async {
    try {
      final meals = await src.searchMealsByName(query);
      setState(() {
        _meals = meals;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 52),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(14)),
              child: TextField(
                controller: _search,
                onSubmitted: (value) {
                  _searchMeals(value);
                },
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        _searchMeals(_search.text);
                      },
                      icon: Icon(
                        FeatherIcons.search,
                        color: Color(0xfffb1b1b1),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: "Search any recipe...",
                    hintStyle: GoogleFonts.manrope(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xfffB1B1B1),
                        height: 170 / 100)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: _meals.isEmpty
                  ? Center(
                      child: Text(
                        'Search something here',
                        style: GoogleFonts.manrope(),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _meals.length,
                      itemBuilder: (context, index) {
                        var meal = _meals[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return DetailMakanan(food: meal);
                              },
                            ));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: tema
                                    ? Colors.green.shade200
                                    : Color.fromARGB(255, 222, 235, 205),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 10,
                                    offset: Offset(0, 1),
                                  )
                                ]),
                            margin: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 108,
                                        width: 108,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image:
                                                NetworkImage(meal.strMealThumb),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(top: 10),
                                              child: Text(
                                                meal.strMeal,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(top: 10),
                                              child: Text(
                                                "This meal is kind of " +
                                                    meal.strCategory +
                                                    " meals",
                                                style: GoogleFonts.poppins(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // child: ListTile(
                          //   title: Text(_meals[index].strMeal),
                          //   subtitle: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text(_meals[index].strArea ?? 'No area info'),
                          //       Text(_meals[index].strCategory ??
                          //           'No category info'),
                          //     ],
                          //   ),
                          // ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.greenAccent,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
              break;
            case 1:
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => SearchPage(),
              //   ),
              // );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Bookmark(),
                ),
              );
              break;
            case 3:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Profile(),
                ),
              );
              break;
          }
        },
        currentIndex: 1,
      ),
    );
  }
}
