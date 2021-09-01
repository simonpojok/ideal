import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

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
