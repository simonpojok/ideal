import 'package:flutter/material.dart';
import 'package:ideal/src/constants.dart';

class DashboardScreen extends StatefulWidget {
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
            Container(
              height: size.height * .4,
              color: Theme.of(context).primaryColor.withOpacity(0.5),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    margin: EdgeInsets.all(kDefaultPadding),
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    color: Colors.black45,
                                    fontSize: 18,
                                  ),
                              border: InputBorder.none,
                            ),
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: Colors.black54,
                                      fontSize: 18,
                                    ),
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            color: Colors.black45,
                          ),
                          iconSize: 30,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
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
                icon: Icons.bookmark,
                label: "Tips",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
          onTap: () {},
        ),
        FeatureCard(
          icon: Icons.notifications_active_outlined,
          label: "My\nMessage",
          onTap: () {},
        ),
        FeatureCard(
          icon: Icons.person_outline_outlined,
          label: "Profile\nInfo",
          onTap: () {},
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

class FeatureCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  const FeatureCard(
      {Key? key, required this.label, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      size: 50,
                      color: Colors.black54,
                    ),
                    Text(
                      label,
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: Colors.black54,
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
