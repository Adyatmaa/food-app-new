import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodapp_new/noto.dart';
import 'package:foodapp_new/spref.dart';
import 'package:foodapp_new/tree.dart';
import 'package:provider/provider.dart';
import 'package:foodapp_new/theme_notifier.dart';  // Import the ThemeNotifier

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Noto.init();
  await SharedPref.init();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, child) {
          return MaterialApp(
            home: tree(),
            debugShowCheckedModeBanner: false,
            theme: themeNotifier.isDarkTheme ? ThemeData.dark() : ThemeData.light(),
          );
        },
      ),
    );
  }
}
