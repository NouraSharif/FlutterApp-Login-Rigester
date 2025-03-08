import 'package:app11/Login.dart';
import 'package:app11/Register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

/*
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp();
    debugPrint("Firebase initialized successfully.");
  } catch (e) {
    debugPrint("Error initializing Firebase: $e");
  }

  // الاتصال بمحاكيات Firebase باستخدام النسخة الحديثة
  FirebaseAuth.instance.useAuthEmulator('localhost', 9099); // محاكي المصادقة
  FirebaseFirestore.instance
      .useFirestoreEmulator('localhost', 8080); // محاكي Firestore

  runApp(const MyApp());
}
*/
void main() {
  FirebaseFirestore.instance.settings =
      const Settings(persistenceEnabled: true);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        debugPrint(
            '===========================================User is currently signed out!');
      } else {
        debugPrint(
            '*******************************************User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const login100(),
      routes: {
        "register": (context) => const Register20(),
        "login": (context) => const login100(),
      },
    );
  }
}
