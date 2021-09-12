import 'package:flutter/material.dart';
import 'package:ideal/src/screens/widgets/labeled_text_input.dart';

import '../../../constants.dart';

class PriceRangeTextInputGroup extends StatelessWidget {
  const PriceRangeTextInputGroup({
    Key? key,
    required TextEditingController fromAmountController,
    required TextEditingController toAmountController,
  })  : _fromAmountController = fromAmountController,
        _toAmountController = toAmountController,
        super(key: key);

  final TextEditingController _fromAmountController;
  final TextEditingController _toAmountController;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LabeledTextInput(
          controller: _fromAmountController,
          hint: "From Amount",
          onChange: (String value) {},
          label: "From",
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding * .5,
          ),
          child: Center(
            child: Text(
              "To",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 18,
                    color: Colors.black45,
                  ),
            ),
          ),
        ),
        LabeledTextInput(
          controller: _toAmountController,
          hint: "To Amount",
          onChange: (String value) {},
          label: "To",
        ),
      ],
    );
  }
}
