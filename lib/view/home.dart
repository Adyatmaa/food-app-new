import 'package:flutter/material.dart';
import 'package:foodapp_new/model/meals.dart';
import 'package:foodapp_new/spref.dart';
import 'package:foodapp_new/theme_notifier.dart';
import 'package:foodapp_new/view/bookmark.dart';
import 'package:foodapp_new/view/categories.dart';
import 'package:foodapp_new/view/detail_makanan.dart';
import 'package:foodapp_new/view/profile.dart';
import 'package:foodapp_new/view/search.dart';
import 'package:foodapp_new/view_model/fetch_meals.dart';
import 'package:foodapp_new/view_model/fetch_random.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';

var category = ["All", "Breakfast", "Lunch", "Dinner"];
var selectedCategory = 0;

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Rnd rnd = Rnd();
  bool tema = false;
  late Future<List<Meals>> futureData;

  @override
  void initState() {
    super.initState();
    loadTheme();
  }

  void loadTheme() async {
    setState(() {
      tema = SharedPref.pref?.getBool('tema') ?? false;
    });
  }

  void saveTheme(bool newTheme) async {
    SharedPref.pref?.setBool('tema', newTheme);
    setState(() {
      tema = newTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
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
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPage(),
                ),
              );
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
        currentIndex: 0,
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              greetings(themeNotifier),
              const SizedBox(
                height: 24,
              ),
              const SizedBox(
                height: 24,
              ),
              banner(context),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Have No Idea What to Cook?',
                        style: GoogleFonts.manrope(
                            fontSize: 26, fontWeight: FontWeight.w800),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Maybe try this...',
                            style: GoogleFonts.manrope(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width,
                      width: MediaQuery.of(context).size.width,
                      child: FutureBuilder(
                          future: rnd.fetchData(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: snapshot.data!.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var meal = snapshot.data![index];
                                    return GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color: tema
                                                ? Colors.green.shade200
                                                : Colors.green.shade700,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 4),
                                        child: Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
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
                                                            image: NetworkImage(meal
                                                                .strMealThumb)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                  ),
                                                  Column(
                                                    children: [
                                                      Container(
                                                        width: 260,
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10,
                                                                top: 10),
                                                        child: Text(
                                                          meal.strMeal,
                                                          style: GoogleFonts
                                                              .manrope(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 260,
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10,
                                                                top: 10),
                                                        child: Text(
                                                          "This meal is kind of " +
                                                              meal.strCategory +
                                                              " meals",
                                                          style: GoogleFonts
                                                              .manrope(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget greetings(ThemeNotifier themeNotifier) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'What are you\ncooking today?',
              style: GoogleFonts.manrope(
                  fontSize: 28, fontWeight: FontWeight.w800),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: IconButton(
                onPressed: () {
                  themeNotifier.toggleTheme();
                },
                icon: Icon(
                  themeNotifier.isDarkTheme
                      ? FeatherIcons.sun
                      : FeatherIcons.moon,
                  size: 20,
                ),
              ),
            )
          ],
        ),
      );
}

Widget banner(BuildContext context) => AspectRatio(
      aspectRatio: 345 / 170,
      child: Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: const Color(0xfffA7DC63),
        ),
        child: Stack(
          children: [
            Image.asset(
              'assets/logo/banner.png',
              height: double.maxFinite,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cook the best\nrecipes at home',
                      style: GoogleFonts.manrope(
                          height: 150 / 100,
                          textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.white)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return CatPage();
                          },
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24))),
                      child: Text(
                        'Explore',
                        style: GoogleFonts.manrope(
                            color: const Color(0xfff7CBA2C),
                            fontWeight: FontWeight.w800),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

Widget categories() => Align(
      alignment: AlignmentDirectional.topStart,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Categories',
              style: GoogleFonts.manrope(
                  fontSize: 24, fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 36,
            child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      decoration: BoxDecoration(
                          color: selectedCategory == index
                              ? const Color(0xfff52AA0C)
                              : const Color(0xfffFFFFF),
                          borderRadius: BorderRadius.circular(24)),
                      child: Center(
                          child: Text(
                        category[index],
                        style: GoogleFonts.manrope(
                            fontWeight: FontWeight.bold,
                            color: selectedCategory == index
                                ? const Color(0xfffFFFFF)
                                : const Color(0xfff868686).withOpacity(.5)),
                      )),
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                itemCount: category.length),
          )
        ],
      ),
    );
