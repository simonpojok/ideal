import 'package:flutter/material.dart';
import 'package:ideal/src/blocs/loan_offer/LoanOfferBlocProvider.dart';
import 'package:ideal/src/constants.dart';
import 'package:ideal/src/models/loan_offer.dart';
import 'package:ideal/src/screens/offer/widgets/price_range_input_group.dart';
import 'package:ideal/src/screens/widgets/filled_text_input.dart';
import 'package:ideal/src/screens/widgets/information_botton_sheet.dart';
import 'package:ideal/src/screens/widgets/loading_modal_botton_sheet.dart';
import 'package:ideal/src/screens/widgets/loan_duration_picker.dart';
import 'package:ideal/src/screens/widgets/rectangular_button.dart';

class OfferScreen extends StatefulWidget {
  static const OFFER_SCREEN_ROUTE = '/offer_screen';

  const OfferScreen({Key? key}) : super(key: key);

  @override
  _OfferScreenState createState() => _OfferScreenState();

  static void goToOfferScreen(BuildContext context) {
    Navigator.of(context).pushNamed(OFFER_SCREEN_ROUTE);
  }
}

class _OfferScreenState extends State<OfferScreen> {
  final TextEditingController _fromAmountController = TextEditingController();
  final TextEditingController _toAmountController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String range = "Month";

  @override
  Widget build(BuildContext context) {
    final _bloc = LoanOfferBlocProvider.of(context).loanOfferBloc;
    return Scaffold(
      appBar: AppBar(
        title: Text("Publish Load Offer"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(
            kDefaultPadding * .5,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: kDefaultPadding,
                  ),
                  child: Text(
                    "Create Loan Offer",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontSize: 20,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: kDefaultPadding * .2,
                    top: kDefaultPadding,
                  ),
                  child: TextInputLabel(
                    label: "Price Range ( UGX )",
                  ),
                ),
                PriceRangeTextInputGroup(
                  fromAmountController: _fromAmountController,
                  toAmountController: _toAmountController,
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: kDefaultPadding),
                      child: TextInputLabel(
                        label: "Price Range ( % )",
                      ),
                    ),
                    TextFormField(
                      controller: _rateController,
                      decoration: InputDecoration(
                        filled: true,
                        border: InputBorder.none,
                        fillColor: Colors.black12,
                      ),
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextInputLabel(label: "Duration"),
                LoanDurationPicker(
                  durationController: _durationController,
                  selectedValue: range,
                  onValueChanged: (String? value) {
                    setState(() {
                      range = value ?? range;
                    });
                  },
                  options: ["Day", "Week", "Month", "Year"],
                ),
                TextInputLabel(label: "Description"),
                FilledTextInput(
                  onChange: (String value) {},
                  hint: "Description",
                  keyboard: TextInputType.multiline,
                  maxLine: 8,
                  controller: _descriptionController,
                ),
                SizedBox(
                  height: 20,
                ),
                RectangularButton(
                  onTap: () {
                    final fromAmount = _fromAmountController.text;
                    final toAmount = _toAmountController.text;
                    final rate = _rateController.text;
                    final duration = _durationController.text;
                    final description = _descriptionController.text;

                    final offer = LoanOffer(
                      fromAmount: double.tryParse(fromAmount) ?? 0.0,
                      toAmount: double.tryParse(toAmount) ?? 0.0,
                      rate: int.tryParse(rate) ?? 0,
                      duration: int.tryParse(duration) ?? 0,
                      range: range,
                      description: description,
                    );

                    LoadingModalBottomSheet.showBottomSheet(
                        context, "Creating Loan Offer...");
                    _bloc.loanOfferApi.createLoanOffer(offer).then((value) {
                      InformationModalBottomSheet.showBottomSheet(context,
                              "Created Successfully", Colors.green, Icons.done)
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
                  label: "Create Offer",
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

class TextInputLabel extends StatelessWidget {
  final String label;

  const TextInputLabel({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
            fontSize: 15,
            color: Colors.black45,
          ),
    );
  }
}
