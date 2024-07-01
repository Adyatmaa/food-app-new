import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:foodapp_new/view_model/fetch_login.dart';

import 'login.dart';

class RegistrationPage extends StatefulWidget {
  RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  bool isPasswordVisible = false;

  Future<void> createUserWithEmailAndPassword() async {
    try {
      if (_controllerPassword.text.length < 6) {
        _showAlertDialog('Password must be at least 6 characters');
        return;
      }
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
      _showAlertDialog('Registration successful');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Login()));
    } on FirebaseAuthException catch (e) {
      _showAlertDialog(e.message ?? 'Registration failed');
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

  Widget _field(String title, TextEditingController controller) {
    return TextField(
      controller: controller,
      style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w500),
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

  Widget _submitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.symmetric(vertical: 15),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 9, 150, 26)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)))),
        onPressed: createUserWithEmailAndPassword,
        child: Text('Register',
            style: GoogleFonts.poppins(
                color: Colors.white, fontWeight: FontWeight.w700)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 247, 247),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Register',style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: Color.fromARGB(255, 169, 169, 169)),),
      ),
      body: Container(
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage('images/start.png'), fit: BoxFit.fill)),
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _field('Email', _controllerEmail),
            SizedBox(height: 12,),
            _field('Password', _controllerPassword),
            SizedBox(height: 24,),
            _submitButton(),
          ],
        ),
      ),
    );
  }
}
