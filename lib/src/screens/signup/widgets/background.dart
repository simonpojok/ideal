import 'package:flutter/material.dart';
import 'package:ideal/src/constants.dart';

class SignUpScreenBackground extends StatelessWidget {
  final Widget child;
  const SignUpScreenBackground({
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
          Container(
            child: child,
            padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
          ),
        ],
      ),
    );
  }
}
