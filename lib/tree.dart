import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodapp_new/view/home.dart';
import 'package:foodapp_new/view/login.dart';
import 'package:foodapp_new/view/splash.dart';
import 'package:foodapp_new/view_model/fetch_login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(tree());
}

class tree extends StatefulWidget {
  tree({super.key});

  @override
  State<tree> createState() => _treeState();
}

class _treeState extends State<tree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashScreen();
        }
        if (snapshot.hasData) {
          return HomeScreen();
        } else {
          return Login();
        }
      },
    );
  }
}
