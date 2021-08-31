import 'package:flutter/material.dart';
import 'package:ideal/src/constants.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 65,
          child: OverflowBar(
            overflowAlignment: OverflowBarAlignment.center,
            children: [
              Row(
                children: [
                  BottomNavigationButton(
                    isActive: index == 0,
                    icon: Icons.feed,
                    label: "Requests",
                    onTap: () {
                      setState(() {
                        index = 0;
                      });
                    },
                  ),
                  BottomNavigationButton(
                    isActive: index == 1,
                    icon: Icons.message,
                    label: "Messages",
                    onTap: () {
                      setState(() {
                        index = 1;
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}

class BottomNavigationButton extends StatelessWidget {
  final bool isActive;
  final VoidCallback onTap;
  final IconData icon;
  final String label;
  const BottomNavigationButton({
    Key? key, required this.isActive, required this.onTap, required this.icon, required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: kDefaultPadding * .5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: isActive ? Theme.of(context).primaryColor : Colors.black54 ,
                  size: 30,
                ),
                Text(
                  label,
                  style: Theme.of(context).textTheme.button!.copyWith(
                        color: isActive ? Theme.of(context).primaryColor : Colors.black54,
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
