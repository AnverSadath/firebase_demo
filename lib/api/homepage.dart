import 'package:firebase_demo/api/auth_service.dart';
import 'package:firebase_demo/api/firebase_messaging_service.dart';
import 'package:firebase_demo/api/sign_in.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseMessagingService servise = FirebaseMessagingService();
  final auth = AuthService();
  @override
  void initState() {
    servise.init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Welcome HomePage...",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () async {
                  await auth.logOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignIn()));
                },
                child: Text("Logout")),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
