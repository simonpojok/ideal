import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ideal/src/constants.dart';

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
      body: LoginScreenBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "LOGIN",
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
          ],
        ),
      ),
    );
  }
}

class RoundCornerTextField extends StatefulWidget {
  final String hint;
  final IconData icon;
  final bool obscureText;
  final Function(String value) onValueChanged;
  final TextInputType keyboardType;
  const RoundCornerTextField({
    Key? key,
    this.hint = "Your Email",
    this.icon = Icons.email,
    this.obscureText = false,
    required this.onValueChanged,
    this.keyboardType = TextInputType.emailAddress,
  }) : super(key: key);

  @override
  _RoundCornerTextFieldState createState() =>
      _RoundCornerTextFieldState(obscureText);
}

class _RoundCornerTextFieldState extends State<RoundCornerTextField> {
  bool obscureText = false;

  _RoundCornerTextFieldState(this.obscureText);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .8,
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
      padding: EdgeInsets.only(
        left: kDefaultPadding * 1.5,
        right: kDefaultPadding * .6,
        top: kDefaultPadding * .2,
        bottom: kDefaultPadding * .2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: widget.hint,
          icon: Icon(
            widget.icon,
            color: Theme.of(context).primaryIconTheme.color,
          ),
          border: InputBorder.none,
          hintStyle: Theme.of(context).primaryTextTheme.bodyText2!.copyWith(
                fontSize: 18,
                color: Theme.of(context)
                    .primaryTextTheme
                    .bodyText2!
                    .color!
                    .withOpacity(.5),
              ),
          suffixIcon: widget.keyboardType == TextInputType.visiblePassword
              ? InkWell(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: obscureText
                      ? Icon(
                          Icons.visibility,
                          size: kDefaultPadding * 1.5,
                          color: Theme.of(context)
                              .primaryTextTheme
                              .bodyText2!
                              .color,
                        )
                      : Icon(
                          Icons.visibility_off,
                          size: kDefaultPadding * 1.5,
                          color: Theme.of(context)
                              .primaryTextTheme
                              .bodyText2!
                              .color,
                        ),
                )
              : null,
        ),
        keyboardType: widget.keyboardType,
        style: Theme.of(context).primaryTextTheme.bodyText2!.copyWith(
              fontSize: 18,
            ),
        obscureText: obscureText,
        onChanged: widget.onValueChanged,
      ),
    );
  }
}

class LoginScreenBackground extends StatelessWidget {
  final Widget child;
  const LoginScreenBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
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
            right: 0,
            child: Image.asset(
              "assets/images/login_bottom.png",
              width: size.width * .3,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
