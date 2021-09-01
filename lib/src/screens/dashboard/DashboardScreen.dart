import 'package:flutter/material.dart';
import 'package:ideal/src/screens/dashboard/widgets/bottom_navigation.dart';
import 'package:ideal/src/screens/dashboard/widgets/feature_container.dart';
import 'package:ideal/src/screens/dashboard/widgets/profile_header.dart';

class DashboardScreen extends StatefulWidget {
  static const DASHBOARD_SCREEN_KEY = ValueKey("DashboardScreen");
  static const DASHBOARD_ROUTE = "/DashboardScreen";
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ProfileHeader(),
            Expanded(
              child: FeatureContainers(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 65,
          width: double.infinity,
          color: Colors.greenAccent,
          child: Row(
            children: [
              BottomNavigationButton(
                isActive: false,
                onTap: () {},
                icon: Icons.calculate_outlined,
                label: "Deal Calc",
              ),
              BottomNavigationButton(
                isActive: false,
                onTap: () {},
                icon: Icons.group_work_outlined,
                label: "Saccos",
              ),
              BottomNavigationButton(
                isActive: false,
                onTap: () {},
                icon: Icons.emoji_food_beverage_outlined,
                label: "Deals",
              ),
              BottomNavigationButton(
                isActive: false,
                onTap: () {},
                icon: Icons.money_sharp,
                label: "Offers",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
