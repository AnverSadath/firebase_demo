import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return cred.user;
    } catch (e) {
      print("Something Went Wrong");
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return cred.user;
    } catch (e) {
      print("Something went wrong");
    }
    return null;
  }

  Future<void> logOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print("Something went wrong");
    }
  }
}
