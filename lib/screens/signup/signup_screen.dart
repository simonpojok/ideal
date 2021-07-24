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
            )
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
  const EditText(
      {Key? key,
      required this.stream,
      required this.sink,
      required this.hintText,
      required this.iconData,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20, right: 10),
                  decoration: BoxDecoration(
                      color: kPrimaryDarkColor,
                      borderRadius: BorderRadius.circular(25)),
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(
                        iconData,
                        color: Colors.white,
                      ),
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
                    obscureText: obscureText,
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
        });
  }
}
