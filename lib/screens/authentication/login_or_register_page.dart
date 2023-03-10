import 'package:dribble_air_app/screens/authentication/sign_up_page.dart';
import 'package:dribble_air_app/screens/screens.dart';
import 'package:flutter/material.dart';

import 'auth_home_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({Key? key}) : super(key: key);

  @override
  _LoginOrRegisterState createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
//intially show login page
  bool showLoginPage = true;
  // toggle between login and register page
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return AuthHomPage(
        onPressed: togglePages,
      );
    } else {
      return SignUpPage(
        onPressed: togglePages,
      );
    }
  }
}
