import 'package:flutter/material.dart';

class PriceIndicator extends StatelessWidget {
  final String price;
  final Color color;
  const PriceIndicator({
    Key? key,
    required this.price,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: price,
        style: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(color: color, fontSize: 18, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: ' ugx',
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(fontWeight: FontWeight.normal, color: color),
          ),
        ],
      ),
    );
  }
}
