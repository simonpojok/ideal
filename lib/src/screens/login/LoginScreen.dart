import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ideal/src/constants.dart';
import 'package:ideal/src/screens/dashboard/DashboardScreen.dart';
import 'package:ideal/src/screens/login/widgets/background.dart';
import 'package:ideal/src/screens/signup/SignUpScreen.dart';
import 'package:ideal/src/screens/widgets/buttons.dart';
import 'package:ideal/src/screens/widgets/text_fields.dart';

class LoginScreen extends StatefulWidget {
  static const LOGIN_SCREEN_ROUTE = "/LoginScreens";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: LoginScreenBackground(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Text(
                  "LOGIN",
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              SvgPicture.asset(
                "assets/icons/login.svg",
                width: size.height * .35,
              ),
              Expanded(child: Text("")),
              RoundCornerTextField(
                onValueChanged: (String email) {},
              ),
              RoundCornerTextField(
                hint: "Password",
                icon: Icons.lock,
                onValueChanged: (String password) {},
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
              ),
              RoundedCornerButton(
                label: "LOGIN",
                press: () {
                  DashboardScreen.goToDashboard(context);
                },
                color: Colors.green,
              ),
              LinkTextButton(
                login: true,
                onPress: () {
                  Navigator.of(context)
                      .pushNamed(SignUpScreen.SIGNUP_SCREEN_ROUTE);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
