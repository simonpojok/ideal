import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ideal/src/blocs/AuthenticationBloc.dart';
import 'package:ideal/src/blocs/AuthenticationBlocProvider.dart';
import 'package:ideal/src/screens/dashboard/DashboardScreen.dart';
import 'package:ideal/src/services/AuthenticationApi.dart';
import 'package:ideal/src/services/AuthenticationService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthenticationApi _authenticationApi = AuthenticationService();
    final AuthenticationBloc _authenticationBloc =
        AuthenticationBloc(_authenticationApi);
    return AuthenticationBlocProvider(
      authenticationBloc: _authenticationBloc,
      child: StreamBuilder(
        initialData: null,
        stream: _authenticationBloc.user,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.lightGreen,
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData && snapshot.data != "") {
            return _buildMaterialApp(DashboardScreen());
          }
          return _buildMaterialApp(DashboardScreen());
        },
      ),
    );
  }

  Widget _buildMaterialApp(Widget homePage) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ideal",
      theme: ThemeData(
        primaryColor: Colors.deepOrangeAccent,
        canvasColor: Colors.lightGreen.shade50,
        bottomAppBarColor: Colors.lightBlueAccent.withOpacity(0.5),
      ),
      home: homePage,
    );
  }
}
