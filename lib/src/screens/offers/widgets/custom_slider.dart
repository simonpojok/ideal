import 'package:flutter/material.dart';

import '../../../constants.dart';

class CustomSlider extends StatelessWidget {
  final double min;
  final double max;
  final double value;
  final int divisions;
  final Function(double value) onChanged;
  const CustomSlider(
      {Key? key,
      required this.min,
      required this.max,
      required this.value,
      required this.divisions,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
          activeTrackColor: kColorOrange, inactiveTrackColor: kLightBlue),
      child: Slider(
        min: min,
        max: max,
        value: value,
        label: "$value",
        divisions: divisions,
        onChanged: onChanged,
      ),
    );
  }
}
