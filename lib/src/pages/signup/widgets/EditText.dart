import 'package:flutter/material.dart';

import '../../../constants.dart';

class EditText extends StatelessWidget {
  final Stream stream;
  final Sink sink;
  final String hintText;
  final IconData iconData;
  final bool obscureText;
  final bool showText;
  final TextInputType keyboardType;
  final VoidCallback? onShowText;

  const EditText({
    Key? key,
    required this.stream,
    required this.sink,
    required this.hintText,
    required this.iconData,
    this.obscureText = false,
    this.keyboardType = TextInputType.emailAddress,
    this.showText = false,
    this.onShowText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  color: kPrimaryDarkColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: obscureText
                        ? InkWell(
                            onTap: onShowText,
                            child: Icon(
                              showText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.white,
                            ),
                          )
                        : null,
                    hintText: hintText,
                    border: InputBorder.none,
                    hintStyle: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: kPrimaryTextColor.withOpacity(.3)),
                  ),
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: kPrimaryTextColor),
                  onChanged: sink.add,
                  obscureText: obscureText && !showText,
                  keyboardType: keyboardType,
                ),
              ),
              if (snapshot.error != null)
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 5),
                  child: Text(
                    snapshot.error.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: Colors.red.shade300),
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}
