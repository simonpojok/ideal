import 'package:flutter/material.dart';
import 'package:ideal/src/constants.dart';
import 'package:ideal/src/screens/widgets/buttons.dart';

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
  final _nameController = TextEditingController(text: "");
  final _priceController = TextEditingController(text: "");
  final _descriptionController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
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
                  press: () {},
                )
              ],
            ),
          ),
        ),
      ),
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
