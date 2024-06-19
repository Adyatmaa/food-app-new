import 'package:flutter/material.dart';
import 'package:foodapp_new/tree.dart';
import 'package:foodapp_new/view/bookmark.dart';
import 'package:foodapp_new/view/home.dart';
import 'package:foodapp_new/view/search.dart';
import 'package:foodapp_new/view_model/fetch_login.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(
              fontSize: 24, color: Colors.black, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            color: Colors.black,
            onPressed: () {
              Auth().signOut();
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => tree()),
                );
            },
          )
        ],
        backgroundColor: Colors.white10,
        elevation: 0,
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
              // Navigasi ke halaman ProfilePage
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPage(),
                ),
              );
              break;
            case 2:
              // Navigasi ke halaman ProfilePage
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Bookmark(),
                ),
              );
              break;
          }
        },
        currentIndex: 3,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                  height: 150,
                  width: 150,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(150)),
                  child: Image.asset(
                    'assets/logo/poto.jpeg',
                    fit: BoxFit.fitWidth,
                  )),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              height: 1,
              margin: EdgeInsets.only(bottom: 8),
              width: double.infinity,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('User Profile',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 23, 25, 28))),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: const Row(
                    children: [
                      Icon(
                        Icons.person,
                        size: 20,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text('Hasan Ilham Zauzan',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 23, 25, 28)))
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  child: const Row(
                    children: [
                      Icon(
                        Icons.badge,
                        size: 20,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text('210605110094',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 23, 25, 28)))
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  child: const Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 20,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text('Kepanjen, Malang',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 23, 25, 28)))
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
