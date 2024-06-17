import 'package:flutter/material.dart';
import 'package:foodapp_new/spref.dart';
import 'package:foodapp_new/view/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  bool tema = await isTheme();
  runApp(MyWidget(tema: tema));
}

Future<bool> isTheme() async {
  bool tema = SharedPref.pref?.getBool('tema') ?? false;
  return tema;
}

// ignore: must_be_immutable
class MyWidget extends StatelessWidget {
  late bool tema;
   MyWidget({super.key, required this.tema});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: SharedPref.pref?.getBool('tema') ?? false
          ? ThemeData.light()
          : ThemeData.dark(),
      // theme: tema ? ThemeData.light() : ThemeData.dark(),`
    );
  }
}
