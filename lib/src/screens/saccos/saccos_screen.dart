import 'package:flutter/material.dart';
import 'package:ideal/src/constants.dart';

const description =
    "Bodaboda business in Kenya is one of the most popular industry in providing informal selfemployment and source of income for many unemployed youth, by offering the basic mode of transportation in both rural and urban areas.Conversely, young people especially the youth who have completed schooling in many parts of country, remain unemployed influencing them to seek for alternative employment in boda boda enterprises as a way of selfemployment";

class SaccosScreen extends StatefulWidget {
  static const SACCOS_SCREEN_ROUTE = "/saccos_screen";

  const SaccosScreen({Key? key}) : super(key: key);

  @override
  _SaccosScreenState createState() => _SaccosScreenState();

  static void goToSaccoScreen(BuildContext context) {
    Navigator.of(context).pushNamed(SACCOS_SCREEN_ROUTE);
  }
}

class _SaccosScreenState extends State<SaccosScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Saving Sacco Groups"),
      ),
      body: SafeArea(
        child: ListView.separated(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              contentPadding: EdgeInsets.zero,
              title: Padding(
                padding: const EdgeInsets.only(
                  left: kDefaultPadding * .5,
                  top: kDefaultPadding * .5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nyero Saving Sacco",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: 18,
                          ),
                    ),
                    Container(
                      padding: EdgeInsets.all(kDefaultPadding * .5),
                      child: Text(
                        "45 members",
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              fontSize: 14,
                            ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              subtitle: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding * .5,
                  vertical: kDefaultPadding * .3,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      description,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Chip(
                          label: Text("OPEN"),
                          backgroundColor: Colors.greenAccent,
                        ),
                        Chip(label: Text("50,000 ugx")),
                        Chip(label: Text("Monthly")),
                        Chip(label: Text("Masaka")),
                      ],
                    )
                  ],
                ),
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
    );
  }
}
