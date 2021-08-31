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
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(kDefaultPadding),
          child: GridView.count(
            crossAxisCount: 3,
            children: [
              FeatureCard(
                icon: Icons.account_balance_wallet_outlined,
                label: "Sacco\nGroup",
                onTap: () {},
              ),
              FeatureCard(
                icon: Icons.monetization_on_outlined,
                label: "Deals\nRequest",
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
          ),
        ),
      ),
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

// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({Key? key}) : super(key: key);
//
//   @override
//   _DashboardScreenState createState() => _DashboardScreenState();
// }
//
// class _DashboardScreenState extends State<DashboardScreen> {
//   int index = 0;
//   List screens = [
//     RequestsScreen(),
//     ChatListScreen(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//           child: screens[index],
//         ),
//         bottomNavigationBar: BottomAppBar(
//           child: Container(
//             height: 65,
//             child: OverflowBar(
//               overflowAlignment: OverflowBarAlignment.center,
//               children: [
//                 Row(
//                   children: [
//                     BottomNavigationButton(
//                       isActive: index == 0,
//                       icon: Icons.feed,
//                       label: "Requests",
//                       onTap: () {
//                         setState(() {
//                           index = 0;
//                         });
//                       },
//                     ),
//                     BottomNavigationButton(
//                       isActive: index == 1,
//                       icon: Icons.message,
//                       label: "Messages",
//                       onTap: () {
//                         setState(() {
//                           index = 1;
//                         });
//                       },
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ));
//   }
// }
//
// class BottomNavigationButton extends StatelessWidget {
//   final bool isActive;
//   final VoidCallback onTap;
//   final IconData icon;
//   final String label;
//   const BottomNavigationButton({
//     Key? key,
//     required this.isActive,
//     required this.onTap,
//     required this.icon,
//     required this.label,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Material(
//         child: InkWell(
//           onTap: onTap,
//           child: Container(
//             color: Colors.white,
//             padding: EdgeInsets.symmetric(vertical: kDefaultPadding * .5),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Icon(
//                   icon,
//                   color: isActive
//                       ? Theme.of(context).primaryColor
//                       : Colors.black54,
//                   size: 30,
//                 ),
//                 Text(
//                   label,
//                   style: Theme.of(context).textTheme.button!.copyWith(
//                         color: isActive
//                             ? Theme.of(context).primaryColor
//                             : Colors.black54,
//                         fontSize: 15,
//                       ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
