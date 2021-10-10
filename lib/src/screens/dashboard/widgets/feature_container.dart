import 'package:flutter/material.dart';
import 'package:ideal/src/screens/deals/deals_screen.dart';
import 'package:ideal/src/screens/messages/MessagesScreen.dart';
import 'package:ideal/src/screens/my_sacco/MySaccoGroup.dart';
import 'package:ideal/src/screens/profile/ProfileScreen.dart';

import 'feature_card.dart';

class FeatureContainers extends StatelessWidget {
  const FeatureContainers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: [
        FeatureCard(
          icon: Icons.group_sharp,
          label: "Sacco\nGroup",
          onTap: () {},
        ),
        FeatureCard(
          icon: Icons.monetization_on_outlined,
          label: "My\nDeals",
          onTap: () {
            DealsScreen.goToUserDealsScreen(context);
          },
        ),
        FeatureCard(
          icon: Icons.notifications_active_outlined,
          label: "My\nMessage",
          onTap: () {
            MessagesScreen.goToMessageScreen(context);
          },
        ),
        FeatureCard(
          icon: Icons.person_outline_outlined,
          label: "Profile\nInfo",
          onTap: () {
            ProfileScreen.goToProfileScreen(context);
          },
        ),
        FeatureCard(
          icon: Icons.payment_outlined,
          label: "Deal\nOffer",
          onTap: () {},
        ),
        FeatureCard(
          icon: Icons.help_center_outlined,
          label: "Support\nhelp",
          onTap: () {},
        ),
      ],
    );
  }
}
