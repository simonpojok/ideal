import 'package:flutter/material.dart';
import 'package:peer2peer/screens/signup/signup_bloc.dart';

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
    // _signUpBloc = SignUpBloc(
    //
    // );
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
            StreamBuilder(
              stream: null,
              builder: (context, snapshot) {
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: kPrimaryDarkColor,
                          borderRadius: BorderRadius.circular(25)
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Name',
                            border: InputBorder.none,
                            hintStyle: Theme.of(context).textTheme.headline6!.copyWith(
                                color: kPrimaryTextColor.withOpacity(.3)
                            )
                          ),
                          style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: kPrimaryTextColor
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 5),
                        child: Text('Required', style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.red.shade300
                        ),),
                      )
                    ],
                  ),
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
