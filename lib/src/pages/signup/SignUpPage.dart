import 'package:flutter/material.dart';
import 'package:ideal/src/pages/signup/widgets/EditText.dart';
import 'package:ideal/src/services/AuthenticationService.dart';

import '../../constants.dart';
import 'SignUpBloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late SignUpBloc _signUpBloc;
  bool showPassword = false;

  @override
  void initState() {
    super.initState();
    _signUpBloc =
        SignUpBloc(authenticationApi: AuthenticationService());
  }

  @override
  void dispose() {
    super.dispose();
    _signUpBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
          mainAxisAlignment: MainAxisAlignment.center,
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
            // CustomButton(
            //   label: "Create Account",
            //   onClick: () {},
            // )
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: size.height * 0.05),
              child: Center(
                child: FloatingActionButton.extended(
                  onPressed: null, label: Text("Create Account"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
