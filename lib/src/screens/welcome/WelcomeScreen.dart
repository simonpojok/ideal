import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ideal/src/constants.dart';
import 'package:ideal/src/screens/login/LoginScreen.dart';

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
      body: WelcomeScreenBackground(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "WELCOME TO iDeal",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.bold,
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
                    label: "LOGIN",
                    color: Theme.of(context).primaryColor,
                    press: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedCornerButton extends StatelessWidget {
  final String label;
  final VoidCallback press;
  final Color color;
  const RoundedCornerButton({
    Key? key,
    required this.label,
    required this.press,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
        child: Material(
          child: InkWell(
            splashColor: Colors.greenAccent,
            onTap: press,
            child: Container(
              width: size.width * .8,
              padding: EdgeInsets.symmetric(
                vertical: kDefaultPadding * .8,
                horizontal: kDefaultPadding * 2,
              ),
              decoration: BoxDecoration(
                color: color.withOpacity(.6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.button!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WelcomeScreenBackground extends StatelessWidget {
  final Widget child;
  const WelcomeScreenBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_top.png",
              width: size.width * .3,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_bottom.png",
              width: size.width * .3,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
