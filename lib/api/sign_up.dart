import 'package:firebase_demo/api/auth_service.dart';
import 'package:firebase_demo/api/sign_in.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

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
              "Sign Up",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                  hintText: "name", border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),
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
                  signUp();
                },
                child: Text("sign up")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have anm Account?"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignIn(),
                          ));
                    },
                    child: Text("Sign in"))
              ],
            )
          ],
        ),
      ),
    );
  }

  signUp() async {
    final user = await auth.createUserWithEmailAndPassword(
        emailController.text, passwordController.text);

    if (user != null) {
      print("User Created Successfully");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignIn()));
    } else {
      print("Something Wrong For User Creation");
    }
  }
}
