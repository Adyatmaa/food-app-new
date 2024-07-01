import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:foodapp_new/tree.dart';
import 'package:foodapp_new/view/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:foodapp_new/view_model/fetch_login.dart';
import 'package:cool_alert/cool_alert.dart';

import 'Registration.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? errorMessage = '';

  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  bool isPasswordVisible = false;

  Future<void> signInWithEmailAndPassword() async {
    try {
      _alertshow(context, 'Login Succsesfull');
    } on FirebaseAuthException {
      _showAlertDialog('Account not registered. Please sign up.');
    }
  }

  void _showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _alertshow(BuildContext context, String message) async {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.success,
      text: message,
      animType: CoolAlertAnimType.slideInUp,
      backgroundColor: Color.fromARGB(255, 20, 181, 79),
      onConfirmBtnTap: () {
        Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text,
          password: _controllerPassword.text,
        );
        // Navigator.of(context, rootNavigator: true).pop();
        Future.delayed(Duration(milliseconds: 100), () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        });
      },
    );
  }

  Widget _field(String title, TextEditingController controller) {
    return TextField(
      controller: controller,
      style:
          GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w500),
      obscureText:
          title.toLowerCase() == 'password' ? !isPasswordVisible : false,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Color.fromARGB(180, 227, 226, 236),
        // rgb(142, 143, 250)
        labelText: title,
        suffixIcon: title.toLowerCase() == 'password'
            ? IconButton(
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
              )
            : null,
      ),
    );
  }

  Widget _submit() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.symmetric(vertical: 15),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 32, 181, 49)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)))),
        onPressed: signInWithEmailAndPassword,
        child: Text('Login',
            style: GoogleFonts.poppins(
                color: Colors.white, fontWeight: FontWeight.w700)),
      ),
    );
  }

  Widget _orDivider() {
    return const Row(
      children: <Widget>[
        Expanded(
          child: Divider(
            color: Colors.black54,
            thickness: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'or',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.black54,
            thickness: 1,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Color.fromARGB(255, 247, 247, 247),
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo/image.jpg',
              height: 160, // Adjust the height as needed
            ),
            SizedBox(height: 40),
            _field('Email', _controllerEmail),
            SizedBox(height: 12),
            _field('Password', _controllerPassword),
            SizedBox(height: 24),
            _submit(),
            SizedBox(height: 12),
            _orDivider(),
            SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(vertical: 15),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 161, 166, 151)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistrationPage()),
                  );
                },
                child: Text('Register',
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontWeight: FontWeight.w700)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
