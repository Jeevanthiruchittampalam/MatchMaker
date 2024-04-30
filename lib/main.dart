import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'widgets/loginscreen.dart'; // Correct import path

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(), // Set LoginScreen as the home
    );
  }
}
