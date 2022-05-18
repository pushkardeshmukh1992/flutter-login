import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in anon
  Future signInAnon() async {
    try {
      final userCredential = await _auth.signInAnonymously();
      print(userCredential.user);
      return userCredential.user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // sign in with email and password

  // register with email and password

  // sign out
}
