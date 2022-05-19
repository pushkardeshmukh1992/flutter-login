import 'package:demo_app/screens/home/authenticate/register.dart';
import 'package:demo_app/screens/home/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool shownSignIn = true;
  void toggleView() {
    setState(() {
      shownSignIn = !shownSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (shownSignIn) {
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
