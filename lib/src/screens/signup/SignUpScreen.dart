import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ideal/src/screens/login/LoginScreen.dart';
import 'package:ideal/src/screens/signup/widgets/background.dart';
import 'package:ideal/src/screens/widgets/buttons.dart';
import 'package:ideal/src/screens/widgets/text_fields.dart';

class SignUpScreen extends StatefulWidget {
  static const SIGNUP_SCREEN_ROUTE = "/SignUpScreen";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SignUpScreenBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "SIGN UP",
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SvgPicture.asset(
              "assets/icons/login.svg",
              width: size.height * .35,
            ),
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
            RoundCornerTextField(
              hint: "Confirm Password",
              icon: Icons.lock,
              onValueChanged: (String password) {},
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
            ),
            RoundedCornerButton(
              label: "SIGN UP",
              press: () {},
              color: Colors.green,
            ),
            LinkTextButton(
              login: false,
              onPress: () {
                Navigator.of(context).pushNamed(LoginScreen.LOGIN_SCREEN_ROUTE);
              },
            )
          ],
        ),
      ),
    );
  }
}
