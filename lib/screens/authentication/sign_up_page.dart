import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dribble_air_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  final Function()? onPressed;
  SignUpPage({Key? key, required this.onPressed}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //text editing controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _cityNameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _cityNameController.dispose();
    super.dispose();
  }

  Future signUserUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      //add user details
      addUserDetails(
        _firstNameController.text.trim(),
        _lastNameController.text.trim(),
        _emailController.text.trim(),
        _cityNameController.text.trim(),
      );
    }
  }

  Future addUserDetails(
    String firstName,
    String lastName,
    String email,
    String cityName,
  ) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstName,
      'last name': lastName,
      'email': email,
      'city': cityName,
    });
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }
  //user sign in method
  // void signUserUp() async {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return Center(
  //           child: CircularProgressIndicator(),
  //         );
  //       });
  //   try {
  //     if (_passwordController.text == _confirmPasswordController.text) {
  //       await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //           email: _emailController.text, password: _passwordController.text);
  //       Navigator.pop(context);
  //     } else {
  //       showErrorMessage('Passwords dont match!');
  //     }
  //     //pop loading circle
  //   } on FirebaseAuthException catch (e) {
  //     //pop the loading circle
  //     Navigator.pop(context);
  //     //show error message
  //     showErrorMessage(e.code);
  //   }
  // }

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
                controller: _emailController,
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
                controller: _passwordController,
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
                controller: _confirmPasswordController,
                onChanged: (newValue) {},
                decoration: const InputDecoration(
                  hintText: "Confirm Password",
                  labelText: "Confirm Password",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: _firstNameController,
                onChanged: (newValue) {},
                decoration: const InputDecoration(
                  hintText: "First Name",
                  labelText: "First Name",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: _lastNameController,
                onChanged: (newValue) {},
                decoration: const InputDecoration(
                  hintText: "Last Name",
                  labelText: "Last Name",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: _cityNameController,
                onChanged: (newValue) {},
                decoration: const InputDecoration(
                  hintText: "City Name",
                  labelText: "City Name",
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
                    signUserUp();
                    // Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff3FB9B1),
                    side: const BorderSide(color: Colors.black, width: 2),
                  ),
                  child: const Text('Sign up'),
                ),
              ),
            ),
            Text('Already Have an account?'),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: SizedBox(
                height: 30,
                width: 100,
                child: ElevatedButton(
                  onPressed: widget.onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffFECAA9),
                    side: const BorderSide(color: Colors.black, width: 2),
                  ),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
