import 'package:flutter/material.dart';
import 'package:ideal/src/constants.dart';

class LoadingModalBottomSheet extends StatelessWidget {
  final String message;

  const LoadingModalBottomSheet({
    Key? key,
    required this.message,
  }) : super(key: key);

  static void showBottomSheet(BuildContext context, String message) {
    showModalBottomSheet<void>(
      context: context,
      isDismissible: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return LoadingModalBottomSheet(
          message: message,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(
                strokeWidth: 6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: kDefaultPadding,
              ),
              child: Text(
                message,
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontSize: 15,
                      color: Colors.black54,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
