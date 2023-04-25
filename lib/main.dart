import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:flutter/material.dart';
import 'package:women_safety_final_project/screens/help_screen.dart';
import 'package:women_safety_final_project/screens/login_screen.dart';
import 'package:women_safety_final_project/screens/main_screen.dart';
import 'package:women_safety_final_project/screens/signup_screen.dart';
import 'package:women_safety_final_project/screens/onBoard_screen.dart';
import 'package:women_safety_final_project/screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final quickActions = QuickActions();

  @override
  void initState() {
    super.initState();
    quickActions.setShortcutItems([
      ShortcutItem(type: 'help', localizedTitle: 'SOS'),
      ShortcutItem(type: 'event', localizedTitle: 'Home screen'),
      ShortcutItem(type: 'statistics', localizedTitle: 'Statistics screen'),
    ]);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return Example();
            } else {
              return OnboardScreen();
            }
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error Occurred'),
            );
          }
          return Text('');
        },
      ),
    );
  }
}
