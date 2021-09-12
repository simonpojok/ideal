import 'package:flutter/material.dart';
import 'package:ideal/src/screens/widgets/filled_text_input.dart';
import 'package:ideal/src/screens/widgets/loan_duration_picker.dart';

import '../../constants.dart';

class CreateDealScreen extends StatefulWidget {
  static const CREATE_DEAL_SCREEN_ROUTE = "/create_deal_screen_route";

  const CreateDealScreen({Key? key}) : super(key: key);

  @override
  _CreateDealScreenState createState() => _CreateDealScreenState();

  static void goToCreateDealScreen(BuildContext context) {
    Navigator.of(context).pushNamed(CREATE_DEAL_SCREEN_ROUTE);
  }
}

class _CreateDealScreenState extends State<CreateDealScreen> {
  final _amountController = TextEditingController();
  final _durationController = TextEditingController();
  String selectedDuration = "Daily";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Loan Request"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            top: kDefaultPadding,
            left: kDefaultPadding,
            right: kDefaultPadding,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
                  child: Text(
                    "Create a Loan Request",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                TextInputLabeled(
                  label: "Expected Amount",
                  hint: "Amount ( UGX )",
                  amountController: _amountController,
                  lineNumber: 1,
                  keyboard: TextInputType.numberWithOptions(decimal: true),
                ),
                Container(
                  margin: EdgeInsets.only(top: kDefaultPadding * .5),
                  child: Text(
                    "Frequency",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 15,
                          color: Colors.black45,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
                LoanDurationPicker(
                  hint: "Frequency",
                  durationController: _durationController,
                  options: ["Daily", "Weekly", "Monthly", "Yearly"],
                  onValueChanged: (String? value) {
                    setState(() {
                      selectedDuration = value ?? selectedDuration;
                    });
                  },
                  selectedValue: selectedDuration,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextInputLabeled extends StatelessWidget {
  final TextEditingController _amountController;
  final String label;
  final String hint;
  final int lineNumber;
  final TextInputType keyboard;
  const TextInputLabeled({
    Key? key,
    required TextEditingController amountController,
    required this.label,
    required this.hint,
    required this.lineNumber,
    required this.keyboard,
  })  : _amountController = amountController,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 15,
                color: Colors.black45,
                fontWeight: FontWeight.normal,
              ),
        ),
        SizedBox(height: 10),
        FilledTextInput(
          onChange: (String value) {},
          hint: hint,
          keyboard: keyboard,
          maxLine: lineNumber,
          controller: _amountController,
        ),
      ],
    );
  }
}
