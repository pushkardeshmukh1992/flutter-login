import 'package:flutter/material.dart';
import 'package:demo_app/services/auth.dart';
import 'package:demo_app/shared/constants.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      minimumSize: const Size.fromHeight(48), // NEW,
      primary: Colors.pink[400]);

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: const Text('Register'),
        actions: <Widget>[
          TextButton.icon(
            // <-- TextButton
            onPressed: () {
              widget.toggleView();
            },
            icon: const Icon(
              Icons.person,
              size: 20.0,
            ),
            label: const Text('Sign In'),
          ),
        ],
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Email'),
                    validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration:
                        textInputDecoration.copyWith(hintText: 'Password'),
                    validator: (val) => val!.length < 6
                        ? 'Enter a password 6+ chars long'
                        : null,
                    obscureText: true,
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        dynamic result = await _auth
                            .registerWithEmailAndPassword(email, password);

                        if (result == null) {
                          setState(() {
                            error = 'Please supply a valid email';
                          });
                        }
                      }
                    },
                    style: buttonStyle,
                    child: const Text('Register'),
                  ),
                  const SizedBox(height: 12),
                  Text(error,
                      style: const TextStyle(color: Colors.red, fontSize: 14))
                ],
              ))),
    );
  }
}
