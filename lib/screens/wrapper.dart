import 'package:demo_app/screens/home/authenticate/authenticate.dart';
import 'package:demo_app/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo_app/models/user.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);

    // return either Home or Authenticate widget
    if (user == null) {
      return const Authenticate();
    } else {
      return const Home();
    }
  }
}
