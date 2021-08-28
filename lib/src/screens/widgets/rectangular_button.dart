import 'package:flutter/material.dart';

class RectangularButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final Color color;
  const RectangularButton({
    Key? key,
    required this.onTap,
    required this.label,
    required this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: color,
        elevation: 4,
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: 50,
            width: size.width * .8,
            child: Center(
              child: Text(
                label,
                style: Theme.of(context).textTheme.button!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
