import 'package:flutter/material.dart';

import '../../constants.dart';

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
        margin: EdgeInsets.symmetric(vertical: kDefaultPadding * .8),
        child: Material(
          child: InkWell(
            splashColor: Colors.greenAccent,
            onTap: press,
            child: Container(
              width: size.width * .8,
              padding: EdgeInsets.symmetric(
                vertical: kDefaultPadding * 1.1,
                horizontal: kDefaultPadding * 2,
              ),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
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

class LinkTextButton extends StatelessWidget {
  final bool login;
  final VoidCallback onPress;
  const LinkTextButton({
    Key? key,
    required this.login,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Don't have an account ? " : "Already have an account ? ",
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                color: Theme.of(context).primaryColor,
              ),
        ),
        TextButton(
          onPressed: onPress,
          child: Text(
            login ? "Sign Up" : "Log In",
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: Colors.blueAccent,
                ),
          ),
        ),
      ],
    );
  }
}
