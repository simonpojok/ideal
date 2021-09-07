import 'package:flutter/material.dart';
import 'package:ideal/src/blocs/sacco/SaccoBloc.dart';
import 'package:ideal/src/blocs/sacco/SaccoBlocProvider.dart';
import 'package:ideal/src/constants.dart';
import 'package:ideal/src/models/sacco.dart';
import 'package:ideal/src/screens/widgets/buttons.dart';
import 'package:ideal/src/screens/widgets/select_dropdown.dart';

class RegisterSaccoScreen extends StatefulWidget {
  static const REGISTER_SACCO_SCREEN = "/register_sacco";

  const RegisterSaccoScreen({Key? key}) : super(key: key);

  @override
  _RegisterSaccoScreenState createState() => _RegisterSaccoScreenState();
  static void goToRegisterSaccoScreen(BuildContext context) {
    Navigator.of(context).pushNamed(REGISTER_SACCO_SCREEN);
  }
}

class _RegisterSaccoScreenState extends State<RegisterSaccoScreen> {
  String _frequency = "Monthly";

  final _nameController = TextEditingController(text: "");
  final _priceController = TextEditingController(text: "");
  final _descriptionController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    final SaccoBloc _bloc = SaccoBlocProvider.of(context).saccoBloc;

    return Scaffold(
      appBar: AppBar(
        title: Text("Register Sacco"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * .5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Center(
                    child: Text(
                      "Sacco Registration",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                EditText(
                  hint: "Name",
                  validator: (value) {},
                  keyboard: TextInputType.name,
                  controller: _nameController,
                ),
                EditText(
                  hint: "Price",
                  validator: (value) {},
                  keyboard: TextInputType.numberWithOptions(decimal: true),
                  controller: _priceController,
                ),
                FrequencySelector(
                  frequency: _frequency,
                  onFrequencyChange: (freq) {
                    setState(() {
                      _frequency = freq ?? "Monthly";
                    });
                  },
                ),
                EditText(
                  hint: "Descriptions",
                  validator: (value) {},
                  keyboard: TextInputType.name,
                  controller: _descriptionController,
                  maxLine: 10,
                ),
                RoundedCornerButton(
                  color: Colors.green,
                  label: "Register",
                  press: () {
                    final _sacco = Sacco(
                        name: _nameController.text,
                        status: "OPEN",
                        price: double.tryParse(_priceController.text) ?? 0,
                        frequency: _frequency,
                        location: "Kampala",
                        description: _descriptionController.text,
                        banner: "");
                    _bloc.register(_sacco).then((value) {
                      Navigator.of(context).pop();
                    }).catchError((error) {
                      print("Error");
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FrequencySelector extends StatelessWidget {
  final String frequency;
  final Function(String? frequency) onFrequencyChange;
  const FrequencySelector({
    Key? key,
    required this.frequency,
    required this.onFrequencyChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            "Frequency",
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                  color: Colors.black54,
                ),
          ),
        ),
        SelectDropDown(
          value: frequency,
          onValueChange: onFrequencyChange,
          options: ["Daily", "Weekly", "Monthly"],
        ),
      ],
    );
  }
}

class EditText extends StatelessWidget {
  final String hint;
  final String? tailingText;
  final String? Function(String? value)? validator;
  final TextEditingController controller;
  final TextInputType keyboard;
  final int maxLine;
  const EditText(
      {Key? key,
      required this.hint,
      this.tailingText,
      required this.validator,
      required this.controller,
      required this.keyboard,
      this.maxLine = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding * .5),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          border: InputBorder.none,
          hintText: hint,
          hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Colors.black45,
                fontSize: 16,
              ),
          suffixText: tailingText,
        ),
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Colors.black54,
              fontSize: 16,
            ),
        keyboardType: keyboard,
        validator: validator,
        maxLines: maxLine,
      ),
    );
  }
}
