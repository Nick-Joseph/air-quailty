import 'package:dribble_air_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //user sign in method
  void signUserUp() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      if (passwordController.text == confirmPasswordController.text) {
        // await FirebaseAuth.instance.createUserWithEmailAndPassword(
        //     email: emailController.text, password: passwordController.text);
        Navigator.pop(context);
      } else {
        showErrorMessage('Passwords dont match!');
      }
      //pop loading circle

    } on FirebaseAuthException catch (e) {
      //pop the loading circle
      Navigator.pop(context);
      //show error message
      showErrorMessage(e.code);
    }
  }

//error message to user
  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.deepPurple,
            title: Center(
              child: Text(
                message,
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        });
  }

// use a ternary operator to open/close the CircularProgressIndicator

// find a way to toggle the show cCircularProgressIndicator
// for example have a button that you're able to click to turn the dialog off and on

//  if the user clicked sign up toggle the CircularProgressIndicator
//  else dont toggle

// pop the screen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Text(
          'Sign Up',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: emailController,
                onChanged: (newValue) {},
                decoration: const InputDecoration(
                    hintText: "Enter Email",
                    labelText: "Email address",
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: passwordController,
                onChanged: (newValue) {},
                decoration: const InputDecoration(
                  hintText: "Enter Password",
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: confirmPasswordController,
                onChanged: (newValue) {},
                decoration: const InputDecoration(
                  hintText: "Confirm Password",
                  labelText: "Confirm Password",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 65,
                width: 375,
                child: ElevatedButton(
                  onPressed: () {
                    // signUserUp();
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff3FB9B1),
                    side: const BorderSide(color: Colors.black, width: 2),
                  ),
                  child: const Text('Sign up'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
