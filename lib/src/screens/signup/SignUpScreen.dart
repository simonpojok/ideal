import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ideal/src/blocs/authentication/AuthenticationBloc.dart';
import 'package:ideal/src/blocs/authentication/AuthenticationBlocProvider.dart';
import 'package:ideal/src/constants.dart';
import 'package:ideal/src/screens/dashboard/DashboardScreen.dart';
import 'package:ideal/src/screens/login/LoginScreen.dart';
import 'package:ideal/src/screens/signup/widgets/background.dart';
import 'package:ideal/src/screens/signup/widgets/or_divider.dart';
import 'package:ideal/src/screens/signup/widgets/social_button.dart';
import 'package:ideal/src/screens/widgets/buttons.dart';
import 'package:ideal/src/screens/widgets/text_fields.dart';

class SignUpScreen extends StatefulWidget {
  static const SIGNUP_SCREEN_ROUTE = "/SignUpScreen";

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String password = "";
  String email = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AuthenticationBloc bloc = AuthenticationBlocProvider.of(context).bloc;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SignUpScreenBackground(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Text(
                    "SIGN UP",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                SvgPicture.asset(
                  "assets/icons/signup.svg",
                  width: size.height * .25,
                ),
                Expanded(child: Text("")),
                RoundCornerTextField(
                  onValueChanged: (String email) {
                    setState(() {
                      this.email = email;
                    });
                  },
                ),
                RoundCornerTextField(
                  hint: "Password",
                  icon: Icons.lock,
                  onValueChanged: (String password) {
                    this.password = password;
                  },
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
                  press: () {
                    bloc.signup(email: email, password: password).then((value) {
                      bloc.login(email: email, password: password);
                      DashboardScreen.goToDashboard(context);
                    }).catchError((onError) {
                      print("Error");
                    });
                  },
                  color: Colors.green,
                ),
                LinkTextButton(
                  login: false,
                  onPress: () {
                    Navigator.of(context)
                        .pushNamed(LoginScreen.LOGIN_SCREEN_ROUTE);
                  },
                ),
                OrDivider(),
                Container(
                  margin: EdgeInsets.all(kDefaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialMediaButton(
                        imageSrc: "assets/icons/facebook.svg",
                        onPress: () {},
                      ),
                      SocialMediaButton(
                        imageSrc: "assets/icons/google-plus.svg",
                        onPress: () {},
                      ),
                      SocialMediaButton(
                        imageSrc: "assets/icons/twitter.svg",
                        onPress: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
