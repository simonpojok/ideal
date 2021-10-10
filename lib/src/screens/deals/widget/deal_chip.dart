import 'package:flutter/material.dart';

import '../../../constants.dart';

class DealActionChip extends StatelessWidget {
  final IconData iconData;
  final int count;
  final VoidCallback onPress;
  const DealActionChip({
    Key? key,
    required this.iconData,
    required this.count,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Material(
          child: InkWell(
            onTap: onPress,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    iconData,
                    size: 18,
                    color: Theme.of(context).primaryColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: kDefaultPadding * .4),
                    child: Text(
                      "$count",
                      style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.black45,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}