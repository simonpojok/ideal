import 'package:flutter/material.dart';

import '../../constants.dart';

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
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding * .5),
      padding: EdgeInsets.only(
        left: kDefaultPadding * 1.5,
        right: kDefaultPadding * .6,
        top: kDefaultPadding * .2,
        bottom: kDefaultPadding * .2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight.withOpacity(.8),
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
