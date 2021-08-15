import 'package:flutter/material.dart';
import 'package:ideal/blocs/AuthenticationBloc.dart';
import 'package:ideal/services/AuthenticationService.dart';
import 'package:ideal/services/authentication_api.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthenticationApi _authenticationApi = AuthenticationService();
    final AuthenticationBloc _authenticationBloc = AuthenticationBloc(_authenticationApi);
    // return AuthenticationB;
  }
}


// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Peer 2 Peer',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         scaffoldBackgroundColor: kPrimaryColor,
//       ),
//       home: FutureBuilder(
//         future: _initializeFirebase(),
//         builder: (context, snapshot) {
//           if(snapshot.connectionState == ConnectionState.done) {
//             final user = FirebaseAuth.instance.currentUser;
//
//             if(user == null) {
//               return LoginScreen();
//             }
//
//             return DashboardScreen();
//           }
//           return Center(
//             child: Scaffold(
//               body: CircularProgressIndicator(),
//             )
//           );
//         }
//       ),
//     );
//   }
//
//   Future<FirebaseApp> _initializeFirebase() async {
//     FirebaseApp firebaseApp = await Firebase.initializeApp();
//     return firebaseApp;
//   }
// }
