import 'package:dribble_air_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  void signUserIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Sign Up',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
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
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 65,
              width: 375,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AuthHomPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff3FB9B1),
                  side: const BorderSide(color: Colors.black, width: 2),
                ),
                child: const Text('Sign in'),
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
                  signUserIn();
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
    );
  }
}
