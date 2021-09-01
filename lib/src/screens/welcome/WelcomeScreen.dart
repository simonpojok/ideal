import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ideal/src/constants.dart';
import 'package:ideal/src/screens/login/LoginScreen.dart';
import 'package:ideal/src/screens/signup/SignUpScreen.dart';
import 'package:ideal/src/screens/welcome/widgets/background.dart';
import 'package:ideal/src/screens/widgets/buttons.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: WelcomeScreenBackground(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      child: Text(
                        "WELCOME TO iDeal",
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: kDefaultPadding * 2,
                    ),
                    SvgPicture.asset(
                      "assets/icons/chat.svg",
                      height: size.height * .5,
                    ),
                    SizedBox(
                      height: kDefaultPadding * 2,
                    ),
                    RoundedCornerButton(
                      label: "LOGIN",
                      color: Theme.of(context).primaryColor,
                      press: () {
                        Navigator.of(context)
                            .pushNamed(LoginScreen.LOGIN_SCREEN_ROUTE);
                      },
                    ),
                    RoundedCornerButton(
                      label: "SIGN UP",
                      color: Colors.green,
                      press: () {
                        Navigator.of(context)
                            .pushNamed(SignUpScreen.SIGNUP_SCREEN_ROUTE);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
