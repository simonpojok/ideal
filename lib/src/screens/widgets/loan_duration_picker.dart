import 'package:flutter/material.dart';
import 'package:ideal/src/screens/calc/loan_calculator.dart';
import 'package:ideal/src/screens/widgets/select_dropdown.dart';

import '../../constants.dart';

class LoanDurationPicker extends StatelessWidget {
  const LoanDurationPicker(
      {Key? key,
      required this.durationController,
      required this.selectedValue,
      required this.onValueChanged,
      required this.options})
      : super(key: key);

  final TextEditingController durationController;
  final String selectedValue;
  final Function(String? value) onValueChanged;
  final List<String> options;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
      width: size.width * .9,
      child: Row(
        children: [
          Expanded(
            child: CalculatorEditText(
              controller: durationController,
              leadingIcon: Icons.calendar_today,
              hint: 'Duration',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Duration Required')),
                  );
                }
                return null;
              },
            ),
          ),
          Expanded(
            child: SelectDropDown(
              value: selectedValue,
              onValueChange: onValueChanged,
              options: options,
            ),
          ),
        ],
      ),
    );
  }
}
