import 'package:dribble_air_app/screens/home_page.dart';
import 'package:dribble_air_app/screens/sign_up_page.dart';
import 'package:dribble_air_app/widgets/check_box.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthHomPage extends StatefulWidget {
  const AuthHomPage({Key? key}) : super(key: key);

  @override
  _AuthHomPageState createState() => _AuthHomPageState();
}

class _AuthHomPageState extends State<AuthHomPage> {
  //text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  //user sign in method
  void signUserIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      //pop loading circle
      Navigator.pop(context);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Welcome back!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Use your credentials below and login to your account',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: emailController,
              onChanged: (newValue) {},
              decoration: const InputDecoration(
                hintText: "Enter Email",
                labelText: "Email address",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.check_circle_outline),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: passwordController,
              obscureText: true,
              onChanged: (newValue) {},
              decoration: const InputDecoration(
                hintText: "Enter Password",
                labelText: "Password",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.remove_red_eye_outlined),
              ),
            ),
          ),
          Row(
            children: [
              const CustomCheckBox(),
              const Text(
                'Remember me',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                      text: 'Forget Password?',
                      style: const TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()),
                ),
              )
            ],
          ),
          SizedBox(
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
              child: const Text('Login my account'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30.0),
            child: Row(
              children: [
                Text(
                  ' Login with the following or',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: SizedBox(
                    height: 30,
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => SignUpPage()),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffFECAA9),
                        side: const BorderSide(color: Colors.black, width: 2),
                      ),
                      child: const Text(
                        'Register',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 65,
              width: 375,
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffF4908E),
                  side: const BorderSide(color: Colors.black, width: 2),
                ),
                icon: Icon(Icons.abc_outlined),
                label: const Text(
                  'Continue with Google',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 65,
              width: 375,
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffF9C7A6),
                  side: const BorderSide(color: Colors.black, width: 2),
                ),
                icon: Icon(Icons.abc_outlined),
                label: const Text(
                  'Continue with Facebook',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
                'by Continuing, you accept our Terms and \n            Conditions, Privacy Policy'),
          )
        ],
      ),
    );
  }
}
