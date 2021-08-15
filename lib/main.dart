 import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:peer2peer/screens/dashboard/dashboard_screen.dart';
import 'package:peer2peer/screens/login/login_screen.dart';
import 'package:peer2peer/screens/signup/signup_screen.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peer 2 Peer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: kPrimaryColor,
      ),
      home: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            final user = FirebaseAuth.instance.currentUser;

            if(user == null) {
              return LoginScreen();
            }

            return DashboardScreen();
          }
          return Center(
            child: Scaffold(
              body: CircularProgressIndicator(),
            )
          );
        }
      ),
    );
  }

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
}
