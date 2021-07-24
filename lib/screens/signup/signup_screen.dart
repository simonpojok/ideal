import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:peer2peer/screens/signup/signup_bloc.dart';
import 'package:peer2peer/services/firebase/FirebaseAuthenticationService.dart';

import '../../constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late SignUpBloc _signUpBloc;
  bool showPassword = false;

  @override
  void initState() {
    super.initState();
    _signUpBloc =
        SignUpBloc(authenticationService: FirebaseAuthenticationService());
  }

  @override
  void dispose() {
    super.dispose();
    _signUpBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text('SIGN UP'),
        backgroundColor: kPrimaryColor,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EditText(
              hintText: 'email',
              stream: _signUpBloc.email,
              sink: _signUpBloc.emailChanged,
              iconData: Icons.email,
            ),
            EditText(
              hintText: 'Password',
              stream: _signUpBloc.password,
              sink: _signUpBloc.passwordChanged,
              iconData: Icons.email,
              obscureText: true,
              showText: showPassword,
              keyboardType: TextInputType.text,
              onShowText: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
            ),
            EditText(
              hintText: 'Confirm Password',
              stream: _signUpBloc.passwordConfirmation,
              sink: _signUpBloc.passwordConfirmationChanged,
              iconData: Icons.email,
              obscureText: true,
              showText: showPassword,
              keyboardType: TextInputType.text,
              onShowText: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

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
          margin: EdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    color: kPrimaryDarkColor,
                    borderRadius: BorderRadius.circular(25)),
                child: TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                        onTap: onShowText,
                        child: Icon(
                          obscureText
                              ? showText
                                  ? Icons.visibility_off
                                  : Icons.visibility
                              : null,
                          color: Colors.white,
                        )),
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
