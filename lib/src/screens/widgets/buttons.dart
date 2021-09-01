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
        margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
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
