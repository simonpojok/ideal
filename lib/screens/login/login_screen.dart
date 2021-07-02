import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: size.height * .20, bottom: size.height * .15),
                child: Center(
                  child: Text(
                    'LOGO',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: kPrimaryTextColor,
                          fontWeight: FontWeight.w800,
                          fontSize: 40,
                        ),
                  ),
                ),
              ),
              Text(
                'Login',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: kPrimaryTextColor),
              ),
              Container(
                margin: EdgeInsets.only(top: kDefaultPadding * 2),
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: kPrimaryTextColor
                  ),
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: InputBorder.none,
                    hintStyle: Theme.of(context).textTheme.headline6!.copyWith(
                      color: kPrimaryTextColor.withOpacity(0.5)
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: kPrimaryDarkColor,
                  borderRadius: BorderRadius.circular(25)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
