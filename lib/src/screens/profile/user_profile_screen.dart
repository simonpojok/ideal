import 'package:flutter/material.dart';
import 'package:ideal/src/blocs/user_profile/UserProfileBlocProvider.dart';
import 'package:ideal/src/models/user_model.dart';
import 'package:ideal/src/screens/profile/widgets/decorated_text_field.dart';
import 'package:ideal/src/screens/profile/widgets/profile_header.dart';
import 'package:ideal/src/screens/widgets/buttons.dart';
import 'package:ideal/src/screens/widgets/labeled_text_input.dart';
import 'package:ideal/src/services/share_preferences/shared_preference_data.dart';

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
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _nationalIdNumberController = TextEditingController();
  final _districtController = TextEditingController();
  final _villageController = TextEditingController();
  LocalUser? _localUser;

  @override
  void initState() {
    super.initState();
    SharedPreferenceData.getCurrentUser().then((value) => _localUser = value);
  }

  @override
  Widget build(BuildContext context) {
    final userProfileApi =
        UserProfileBlocProvider.of(context).userProfileBloc.api;
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder(
              future: userProfileApi.getCurrentUser(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                bool hasError = snapshot.hasError;
                bool hasData = snapshot.hasData && !snapshot.data!.exists;
                bool loading =
                    !(snapshot.connectionState == ConnectionState.done);
                // Map<String, dynamic>? data = hasData ? snapshot.data!.data() as Map<String, dynamic> : null;
                Map<String, dynamic>? data =
                    (hasData && !loading) ? snapshot.data.data() : null;

                if (data != null) {
                  LocalUser user = LocalUser.fromJson(data);
                  _firstNameController.text = user.firstName;
                  _lastNameController.text = user.lastName;
                  _emailController.text = user.email;
                  _nationalIdNumberController.text = user.nin;
                  _districtController.text = user.district;
                  _villageController.text = user.village;
                }
                _emailController.text = _localUser?.email ?? "";

                return Container(
                  child: Column(
                    children: [
                      UserProfileHeader(),
                      DecoratedTextField(
                        controller: _firstNameController,
                        label: "First Name",
                      ),
                      DecoratedTextField(
                        controller: _lastNameController,
                        label: "Last Name",
                      ),
                      DecoratedTextField(
                        enabled: false,
                        controller: _emailController,
                        label: "Email",
                      ),
                      DecoratedTextField(
                        controller: _nationalIdNumberController,
                        label: "NIN",
                      ),
                      DecoratedTextField(
                        controller: _districtController,
                        label: "District",
                      ),
                      DecoratedTextField(
                        controller: _villageController,
                        label: "Village",
                      ),
                      RoundedCornerButton(
                        color: kPrimaryDarkColor,
                        press: () async {
                          final user = LocalUser(
                            id: _localUser?.id ?? "",
                            username: "",
                            firstName: _firstNameController.text,
                            lastName: _lastNameController.text,
                            email: _localUser?.email ?? "",
                            nin: _nationalIdNumberController.text,
                            district: _districtController.text,
                            village: _villageController.text,
                          );
                          userProfileApi
                              .createOrUpdateCurrentUser(user)
                              .then((value) => print("User Created"))
                              .catchError((error) => print("Error occurred"));
                        },
                        label: 'Update',
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }

  void createLocalUserProfile() {
    // LocalUser({
    //   required this.id,
    //   required this.username,
    //   required this.firstName,
    //   required this.lastName,
    //   required this.email,
    //   required this.nin,
    //   required this.district,
    //   required this.village,
    // });
  }
}
