import 'dart:ui';

import 'package:dribble_air_app/screens/home_page.dart';
import 'package:dribble_air_app/widgets/check_box.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthHomPage extends StatefulWidget {
  const AuthHomPage({Key? key}) : super(key: key);

  @override
  _AuthHomPageState createState() => _AuthHomPageState();
}

class _AuthHomPageState extends State<AuthHomPage> {
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Welcome back!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Use your credentials below and login to your account',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              onChanged: (newValue) {},
              decoration: InputDecoration(
                  hintText: "Enter Email",
                  labelText: "Email address",
                  border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              onChanged: (newValue) {},
              decoration: InputDecoration(
                hintText: "Enter Password",
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Row(
            children: [
              CustomCheckBox(),
              Text(
                'Remember me',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                      text: 'Forget Password?',
                      style: TextStyle(
                          color: Colors.grey,
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              child: Text('Login my account'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff3FB9B1),
                side: BorderSide(color: Colors.black, width: 2),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              'Or Login with',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 65,
              width: 375,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Continue with Google',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffF4908E),
                  side: BorderSide(color: Colors.black, width: 2),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 65,
              width: 375,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Continue with Facebook',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffF9C7A6),
                  side: BorderSide(color: Colors.black, width: 2),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
                'by Continuing, you accept our Terms and \n            Conditions, Privacy Policy'),
          )
        ],
      ),
    );
  }
}
