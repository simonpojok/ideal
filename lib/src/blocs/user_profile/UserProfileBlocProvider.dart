import 'package:flutter/cupertino.dart';
import 'package:ideal/src/blocs/user_profile/UserProfileBloc.dart';

class UserProfileBlocProvider extends InheritedWidget {
  final UserProfileBloc userProfileBloc;

  UserProfileBlocProvider(
      {Key? key, required this.userProfileBloc, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant UserProfileBlocProvider oldWidget) =>
      userProfileBloc != oldWidget.userProfileBloc;

  static UserProfileBlocProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType()
        as UserProfileBlocProvider;
  }
}
