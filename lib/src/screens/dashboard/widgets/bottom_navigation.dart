import 'package:flutter/material.dart';

import '../../../constants.dart';

class BottomNavigationButton extends StatelessWidget {
  final bool isActive;
  final VoidCallback onTap;
  final IconData icon;
  final String label;
  const BottomNavigationButton({
    Key? key,
    required this.isActive,
    required this.onTap,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        child: InkWell(
          onTap: onTap,
          splashColor: Colors.blueGrey,
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: kDefaultPadding * .5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: isActive
                      ? Theme.of(context).primaryColor
                      : Colors.black54,
                  size: 30,
                ),
                Text(
                  label,
                  style: Theme.of(context).textTheme.button!.copyWith(
                        color: isActive
                            ? Theme.of(context).primaryColor
                            : Colors.black54,
                        fontSize: 15,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
