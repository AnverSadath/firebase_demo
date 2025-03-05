import 'package:firebase_demo/api/auth_service.dart';
import 'package:firebase_demo/api/homepage.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign In",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: "email", border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: "password", border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  signIn();
                },
                child: Text("sign in")),
          ],
        ),
      ),
    );
  }

  signIn() async {
    final signin = await auth.signInWithEmailAndPassword(
        emailController.text, passwordController.text);
    if (signin != null) {
      print("Login Successffull");
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(title: ""),
          ));
    } else {
      print("Login Unsuccessfull");
    }
  }
}
