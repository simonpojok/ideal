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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              HeaderDisplay(),
              Container(
                margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
                width: size.width * .9,
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    hintText: "Enter Amount",
                    hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.black45,
                          fontSize: 16,
                        ),
                    prefixIcon: Icon(
                      Icons.monetization_on_outlined,
                      color: Colors.black45,
                    ),
                    suffix: Text("UGX"),
                  ),
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                ),
              ),
              RoundedCornerButton(
                label: "Calculate",
                press: () {},
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderDisplay extends StatelessWidget {
  const HeaderDisplay({
    Key? key,
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
            text: "Total Amount\n500, 000",
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
