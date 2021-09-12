import 'package:flutter/material.dart';

import '../../constants.dart';
import 'filled_text_input.dart';

class LabeledTextInput extends StatelessWidget {
  final String hint;
  final Function(String value) onChange;
  final String label;

  const LabeledTextInput({
    Key? key,
    required this.hint,
    required this.onChange,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: kDefaultPadding * .5,
            ),
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 15,
                    color: Colors.black45,
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ),
          FilledTextInput(
            onChange: onChange,
            hint: hint,
            keyboard: TextInputType.numberWithOptions(decimal: true),
            maxLine: 1,
          ),
        ],
      ),
    ));
  }
}
