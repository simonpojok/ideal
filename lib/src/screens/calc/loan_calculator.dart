import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ideal/src/constants.dart';
import 'package:ideal/src/screens/widgets/buttons.dart';

class LoanCalculatorScreen extends StatefulWidget {
  static const LOAN_CALCULATOR_ROUTE = "/loan_calculator_route";

  const LoanCalculatorScreen({Key? key}) : super(key: key);

  @override
  _LoanCalculatorScreenState createState() => _LoanCalculatorScreenState();

  static void goToLoanCalculator(BuildContext context) {
    Navigator.of(context).pushNamed(LOAN_CALCULATOR_ROUTE);
  }
}

class _LoanCalculatorScreenState extends State<LoanCalculatorScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController(text: "0");
  final _durationController = TextEditingController(text: "0");
  final _rateController = TextEditingController(text: "0");
  String duration = 'Day';
  String percentage = "%";
  String amount = "0.0";

  void _calculateLoan() {
    double interestRate = (double.parse(_rateController.text) / 100) / 12;
    int months = int.parse(_durationController.text) * 12;
    double monthlyTop = interestRate * pow((1 + interestRate), months);
    double monthlyBottom = pow(1 + interestRate, months) - 1;
    double monthlyRate =
        double.parse(_amountController.text) * (monthlyTop / monthlyBottom);
    double totalPayment = monthlyRate * months;
    setState(() {
      amount = totalPayment.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Loan Calculator"),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                HeaderDisplay(
                  amount: amount,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
                  width: size.width * .9,
                  child: CalculatorEditText(
                    controller: _amountController,
                    hint: "Amount",
                    leadingIcon: Icons.monetization_on_outlined,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Amount Required')),
                        );
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
                  width: size.width * .9,
                  child: Row(
                    children: [
                      Expanded(
                        child: CalculatorEditText(
                          controller: _durationController,
                          leadingIcon: Icons.calendar_today,
                          hint: 'Duration',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Duration Required')),
                              );
                            }
                            return null;
                          },
                        ),
                      ),
                      Expanded(
                        child: SelectDropDown(
                          value: duration,
                          onValueChange: (String? value) {
                            setState(() {
                              duration = value!;
                            });
                          },
                          options: ["Day", "Week", "Month", "Year"],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
                  width: size.width * .9,
                  child: Row(
                    children: [
                      Expanded(
                        child: CalculatorEditText(
                          controller: _rateController,
                          leadingIcon: Icons.rate_review,
                          hint: 'Rate',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Rate Required')),
                              );
                            }
                            return null;
                          },
                        ),
                      ),
                      Expanded(
                        child: SelectDropDown(
                          value: percentage,
                          onValueChange: (String? value) {
                            setState(() {
                              percentage = value!;
                            });
                          },
                          options: ["%"],
                        ),
                      ),
                    ],
                  ),
                ),
                RoundedCornerButton(
                  label: "Calculate",
                  press: () {
                    if (_formKey.currentState!.validate()) {
                      _calculateLoan();
                    }
                  },
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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

class CalculatorEditText extends StatelessWidget {
  final String hint;
  final IconData leadingIcon;
  final String? tailingText;
  final String? Function(String? value)? validator;
  final TextEditingController controller;
  const CalculatorEditText(
      {Key? key,
      required this.hint,
      required this.leadingIcon,
      this.tailingText,
      required this.validator,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        border: InputBorder.none,
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Colors.black45,
              fontSize: 16,
            ),
        prefixIcon: Icon(
          leadingIcon,
          color: Theme.of(context).primaryColorLight,
        ),
        suffixText: tailingText,
      ),
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
            color: Colors.black54,
            fontSize: 16,
          ),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      validator: validator,
    );
  }
}

class HeaderDisplay extends StatelessWidget {
  final String amount;
  const HeaderDisplay({
    Key? key,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * .3,
      color: Theme.of(context).primaryColor,
      child: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: "Total Amount\n$amount",
            style: Theme.of(context).primaryTextTheme.headline5!.copyWith(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
            children: [
              TextSpan(
                text: "\t\tUGX",
                style: Theme.of(context).primaryTextTheme.headline6!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.orangeAccent,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
