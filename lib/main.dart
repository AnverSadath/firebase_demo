import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_demo/api/firebase_api.dart';
import 'package:firebase_demo/api/firebase_messaging_service.dart';
import 'package:firebase_demo/api/sign_up.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotofication();
  FirebaseMessagingService().init(); // Initialize messaging service
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SignUp(),
    );
  }
}
