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
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 65,
          child: OverflowBar(
            overflowAlignment: OverflowBarAlignment.center,
            children: [
              Row(
                children: [
                  BottomNavigationButton(
                    isActive: true,
                  ),
                  BottomNavigationButton(
                    isActive: false,
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
  const BottomNavigationButton({
    Key? key, required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        child: InkWell(
          onTap: () {},
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: kDefaultPadding * .5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.feed,
                  color: isActive ? Theme.of(context).primaryColor : Colors.black54 ,
                  size: 30,
                ),
                Text(
                  "Feeds",
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
