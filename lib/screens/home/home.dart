import 'package:demo_app/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService auth = AuthService();

    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
            // <-- TextButton
            onPressed: () {
              auth.signOut();
            },
            icon: const Icon(
              Icons.person,
              size: 20.0,
            ),
            label: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
