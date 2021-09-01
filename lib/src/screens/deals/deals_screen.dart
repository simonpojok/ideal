import 'package:flutter/material.dart';

class DealsScreen extends StatefulWidget {
  static const DEALS_SCREEN = "/DealsListScreen";

  static const DEALS_LIST_KEY = ValueKey("DealsListScreen");
  const DealsScreen({Key? key}) : super(key: key);

  @override
  _DealsScreenState createState() => _DealsScreenState();

  static void goToDealsScreen(BuildContext context) {
    Navigator.of(context).pushNamed(DEALS_SCREEN);
  }
}

class _DealsScreenState extends State<DealsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deals"),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // RichText(
                  //   text: TextSpan(
                  //       text: "3,000, 000\t\t",
                  //       style: Theme.of(context).textTheme.headline6!.copyWith(
                  //             color: Colors.black54,
                  //             fontSize: 18,
                  //           ),
                  //       children: [
                  //         TextSpan(
                  //           text: "UGX",
                  //           style:
                  //               Theme.of(context).textTheme.headline6!.copyWith(
                  //                     color: Colors.orange,
                  //                     fontSize: 15,
                  //                   ),
                  //         )
                  //       ]),
                  // ),
                  Text(
                    "Simon Peter Ojok",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.orange,
                          fontSize: 18,
                        ),
                  ),
                  Text(
                    "12-06-2023",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Colors.black45,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                  )
                ],
              ),
            ),
            subtitle: Column(
              children: [],
            ),
          );
        },
        itemCount: 30,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 1,
          );
        },
      ),
    );
  }
}
