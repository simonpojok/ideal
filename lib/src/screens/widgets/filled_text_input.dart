import 'package:flutter/material.dart';

class FilledTextInput extends StatelessWidget {
  const FilledTextInput({
    Key? key,
    required this.onChange,
    required this.hint,
    required this.keyboard,
    required this.maxLine,
  }) : super(key: key);

  final Function(String value) onChange;
  final String hint;
  final TextInputType keyboard;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        border: InputBorder.none,
        fillColor: Colors.black12,
        hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 15,
              color: Colors.black26,
            ),
      ),
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
            fontSize: 15,
            color: Colors.black45,
          ),
      keyboardType: keyboard,
      maxLines: maxLine,
    );
  }
}
