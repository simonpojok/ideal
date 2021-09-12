import 'package:flutter/material.dart';

import '../../constants.dart';

class InformationModalBottomSheet extends StatelessWidget {
  final String message;
  final Color color;
  final IconData icon;

  const InformationModalBottomSheet({
    Key? key,
    required this.message,
    required this.color,
    required this.icon,
  }) : super(key: key);

  static Future<void> showBottomSheet(
      BuildContext context, String message, Color color, IconData icon) {
    return showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return InformationModalBottomSheet(
          message: message,
          color: color,
          icon: icon,
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
              width: 100,
              height: 100,
              child: Container(
                child: Icon(
                  icon,
                  size: 60,
                  color: Colors.white70,
                ),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(100),
                ),
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
