import 'package:dribble_air_app/screens/home_page.dart';
import 'package:dribble_air_app/widgets/check_box.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
              onChanged: (newValue) {},
              decoration: const InputDecoration(
                hintText: "Enter Password",
                labelText: "Password",
                border: OutlineInputBorder(),
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
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff3FB9B1),
                side: const BorderSide(color: Colors.black, width: 2),
              ),
              child: const Text('Login my account'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(30.0),
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffF4908E),
                  side: const BorderSide(color: Colors.black, width: 2),
                ),
                child: const Text(
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
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffF9C7A6),
                  side: const BorderSide(color: Colors.black, width: 2),
                ),
                child: const Text(
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
