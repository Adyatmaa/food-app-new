import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:foodapp_new/view/bookmark.dart';
import 'package:foodapp_new/view/home.dart';
import 'package:foodapp_new/view/profile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchPage extends StatefulWidget {
  SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _search = TextEditingController();

  List _meals = [];

  Future<void> _searchMeals(String query) async {
    final url = 'https://www.themealdb.com/api/json/v1/1/search.php?s=$query';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _meals = data['meals'] ?? [];
      });
    } else {
      // Handle error
      print('Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
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
                  ? Center(child: Text('Search somethin'))
                  : ListView.builder(
                      itemCount: _meals.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_meals[index]['strMeal']),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(_meals[index]['strArea'] ?? 'No area info'),
                              Text(_meals[index]['strCategory'] ??
                                  'No category info'),
                            ],
                          ),
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
