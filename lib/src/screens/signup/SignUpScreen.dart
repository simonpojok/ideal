import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ideal/src/constants.dart';
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
      body: SafeArea(
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
    );
  }
}

class SocialMediaButton extends StatelessWidget {
  final VoidCallback onPress;
  final String imageSrc;
  const SocialMediaButton({
    Key? key,
    required this.onPress,
    required this.imageSrc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(kDefaultPadding),
        margin: EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).primaryColorLight,
            width: 2,
          ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          imageSrc,
          width: kDefaultPadding,
          height: kDefaultPadding,
        ),
      ),
    );
  }
}

class OrDivider extends StatelessWidget {
  const OrDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .8,
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: Theme.of(context).primaryColor,
              height: 1.5,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding * .5),
            child: Text(
              "OR",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: Theme.of(context).primaryColor,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
