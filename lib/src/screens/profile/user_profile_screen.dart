import 'package:flutter/material.dart';
import 'package:ideal/src/screens/profile/widgets/decorated_text_field.dart';
import 'package:ideal/src/screens/profile/widgets/profile_header.dart';
import 'package:ideal/src/screens/widgets/labeled_text_input.dart';

import '../../constants.dart';

class UserProfileScreen extends StatefulWidget {
  static const PROFILE_SCREEN_ROUTE = "/profile_screen";

  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();

  static void goToUserProfileScreen(BuildContext context) {
    Navigator.of(context).pushNamed(PROFILE_SCREEN_ROUTE);
  }
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final _firstNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              UserProfileHeader(),
              DecoratedTextField(
                controller: _firstNameController,
                label: "First Name",
              )
            ],
          ),
        ),
      ),
    );
  }
}
