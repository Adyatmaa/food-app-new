import 'package:flutter/material.dart';
import 'package:foodapp_new/model/mark.dart';
import 'package:foodapp_new/view/home.dart';
import 'package:foodapp_new/view/profile.dart';
import 'package:foodapp_new/view/search.dart';
import 'package:foodapp_new/view_model/database.dart';
import 'package:google_fonts/google_fonts.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({Key? key}) : super(key: key);

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Your favourite foods',
          style: GoogleFonts.manrope(fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<List<MyMeals>>(
            future: Nyarap().list(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                print(snapshot.data);
                return Center(
                  child: Text('error1 ${snapshot.error}'),
                );
              } else if (snapshot.hasData) {
                final bookmarks = snapshot.data as List<MyMeals>;
                return ListView.builder(
                  itemCount: bookmarks.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        bookmarks[index].strMealThumb)),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          Column(
                            children: [
                              Container(
                                width: 260,
                                // height: 50,
                                padding: EdgeInsets.only(left: 10, top: 10),
                                child: Text(
                                  bookmarks[index].strMeal,
                                  style: GoogleFonts.manrope(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: Text('No data'),
                );
              }
            }),
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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPage(),
                ),
              );
              break;
            case 2:
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => Profile(),
            //   ),
            // );
            // break;
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
        currentIndex: 2,
      ),
    );
  }
}
