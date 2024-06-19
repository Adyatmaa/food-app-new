import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodapp_new/tree.dart';
import 'package:foodapp_new/view/home%20copy.dart';
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
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
      _alertshow('Login Succsesfull');
      MaterialPageRoute(builder: (context) => HomeScreen());
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

  void _alertshow(String message) {
    CoolAlert.show(
        context: context,
        type: CoolAlertType.success,
        text: message,
        animType: CoolAlertAnimType.slideInUp,
        backgroundColor: Color.fromARGB(255, 35, 23, 80));
  }

  Widget _field(String title, TextEditingController controller) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      obscureText:
          title.toLowerCase() == 'password' ? !isPasswordVisible : false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(180, 25, 4, 130),
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
    return ElevatedButton(
      onPressed: signInWithEmailAndPassword,
      child: Text('Login', style: GoogleFonts.poppins()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _field('Email', _controllerEmail),
            SizedBox(height: 12),
            _field('Password', _controllerPassword),
            SizedBox(height: 12),
            _submit(),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrationPage()),
                );
              },
              child: Text('Register here', style: GoogleFonts.poppins()),
            ),
          ],
        ),
      ),
    );
  }
}
