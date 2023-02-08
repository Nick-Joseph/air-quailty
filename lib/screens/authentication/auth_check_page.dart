import 'package:dribble_air_app/screens/authentication/login_or_register_page.dart';

import 'package:dribble_air_app/screens/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //is the user logged in
          if (snapshot.hasData) {
            return HomePage();
          } else {
            //is the user not logged in
            return LoginOrRegister();
          }
        },
      ),
    );
  }
}
