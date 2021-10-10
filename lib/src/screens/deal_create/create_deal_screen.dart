import 'package:flutter/material.dart';
import 'package:ideal/src/blocs/authentication/AuthenticationBlocProvider.dart';
import 'package:ideal/src/blocs/deal/DealBlocProvider.dart';
import 'package:ideal/src/models/deal_model.dart';
import 'package:ideal/src/models/user_model.dart';
import 'package:ideal/src/screens/widgets/filled_text_input.dart';
import 'package:ideal/src/screens/widgets/information_botton_sheet.dart';
import 'package:ideal/src/screens/widgets/loading_modal_botton_sheet.dart';
import 'package:ideal/src/screens/widgets/rectangular_button.dart';
import 'package:ideal/src/screens/widgets/select_dropdown.dart';

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
  final _descriptionController = TextEditingController();
  final _rateController = TextEditingController();
  final _locationController = TextEditingController();
  String selectedFrequency = "Daily";

  @override
  Widget build(BuildContext context) {
    final _dealService = DealBlocProvider.of(context).dealBloc.dealApi;
    final _localUser =
        AuthenticationBlocProvider.of(context).bloc.getLocalUser();
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
                  margin: EdgeInsets.only(top: kDefaultPadding),
                  padding: EdgeInsets.only(left: kDefaultPadding * .3),
                  color: Colors.black12,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Frequency",
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 15,
                                    color: Colors.black45,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                      SelectDropDown(
                        value: selectedFrequency,
                        onValueChange: (String? value) {
                          setState(() {
                            selectedFrequency = value ?? selectedFrequency;
                          });
                        },
                        options: ["Daily", "Weekly", "Monthly", "Yearly"],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                TextInputLabeled(
                  label: "Expected Rate",
                  hint: "Percentage  ( % )",
                  amountController: _rateController,
                  lineNumber: 1,
                  keyboard: TextInputType.numberWithOptions(decimal: true),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: TextInputLabeled(
                    label: "Location",
                    hint: "Your Location",
                    amountController: _locationController,
                    lineNumber: 1,
                    keyboard: TextInputType.text,
                  ),
                ),
                TextInputLabeled(
                  label: "Comment",
                  hint: "comment here",
                  amountController: _descriptionController,
                  lineNumber: 6,
                  keyboard: TextInputType.text,
                ),
                SizedBox(height: 10),
                RectangularButton(
                  onTap: () {
                    final amount = _amountController.text;
                    final rate = _rateController.text;
                    final location = _locationController.text;
                    final description = _descriptionController.text;

                    Deal deal = Deal(
                        description: description,
                        price: double.tryParse(amount) ?? 0.0,
                        frequency: selectedFrequency,
                        rate: double.tryParse(rate) ?? 0.0,
                        location: location,
                        date: new DateTime.now().toIso8601String(),
                        user: _localUser,
                        userId: _localUser.id);

                    LoadingModalBottomSheet.showBottomSheet(
                        context, "Posting Loan Request...");
                    _dealService.postDeal(deal).then((value) {
                      InformationModalBottomSheet.showBottomSheet(context,
                              "Posted Successfully", Colors.green, Icons.done)
                          .then((value) {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      });
                    }).catchError((error) {
                      InformationModalBottomSheet.showBottomSheet(
                              context,
                              "Unknown Error!\nTry again later",
                              Colors.red,
                              Icons.error_outline)
                          .then((value) {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      });
                    });
                  },
                  color: Colors.greenAccent,
                  label: 'Create Request',
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
