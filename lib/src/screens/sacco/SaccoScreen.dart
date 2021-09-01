import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ideal/src/constants.dart';
import 'package:ideal/src/screens/saccos/saccos_screen.dart';

class SaccoScreen extends StatefulWidget {
  static const SACCO_SCREEN_ROUTE = "/sacco_screen";

  const SaccoScreen({Key? key}) : super(key: key);

  @override
  _SaccoScreenState createState() => _SaccoScreenState();

  static void goToSaccoScreen(BuildContext context) {
    Navigator.of(context).pushNamed(SACCO_SCREEN_ROUTE);
  }
}

class _SaccoScreenState extends State<SaccoScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height * .3,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.share,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Kigumba Youth's Sacco",
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/background/sacco_background.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding * .5),
                child: Text(
                  description,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: kDefaultPadding * .5),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.black45,
                        padding: EdgeInsets.symmetric(
                          vertical: kDefaultPadding * .8,
                          horizontal: kDefaultPadding,
                        ),
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              text: "500, 000",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    color: Colors.white70,
                                    fontSize: 18,
                                  ),
                              children: [
                                TextSpan(
                                    text: "\t\tUGX",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          color: Colors.orangeAccent,
                                          fontSize: 15,
                                        ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.green,
                        padding: EdgeInsets.symmetric(
                          vertical: kDefaultPadding * .8,
                          horizontal: kDefaultPadding,
                        ),
                        child: Center(
                          child: Text(
                            "JOIN",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Colors.white70,
                                      fontSize: 18,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height * .5,
                child: ListView.separated(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: kDefaultPadding * .3),
                      leading: CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage("assets/images/hulk.jpg"),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "OJOK SIMON PETER",
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      fontSize: 18,
                                      color: Colors.black45,
                                    ),
                          ),
                          IconButton(
                            icon: Icon(Icons.more_vert),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Member",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 15,
                                      color: Colors.black26,
                                    ),
                          ),
                          Text(
                            "Since 21-05-2021",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 15,
                                      color: Colors.green,
                                    ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      height: 1,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
