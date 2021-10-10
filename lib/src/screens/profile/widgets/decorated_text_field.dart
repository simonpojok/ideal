import 'package:flutter/material.dart';

import '../../../constants.dart';

class DecoratedTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool enabled;

  const DecoratedTextField({
    Key? key,
    required this.controller,
    required this.label, this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding * .4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: 16.0,
                  color: kPrimaryColor,
                ),
          ),
          SizedBox(
            height: kDefaultPadding * .5,
          ),
          TextField(
            enabled: enabled,
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              border: InputBorder.none,
              fillColor: kPrimaryLightColor.withOpacity(0.5),
            ),
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontSize: 18.0,
                ),
          ),
        ],
      ),
    );
  }
}
