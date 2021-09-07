import 'package:flutter/material.dart';

import '../../constants.dart';

class SelectDropDown extends StatelessWidget {
  final String value;
  final Function(String? value) onValueChange;
  final List<String> options;
  const SelectDropDown(
      {Key? key,
      required this.value,
      required this.onValueChange,
      required this.options})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: kDefaultPadding * .5),
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      color: Colors.black12,
      child: Center(
        child: DropdownButton<String>(
          value: value,
          iconSize: 24,
          elevation: 16,
          underline: Container(),
          onChanged: onValueChange,
          items: options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
