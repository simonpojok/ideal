import 'package:flutter/material.dart';
import 'package:ideal/src/blocs/sacco/SaccoBloc.dart';
import 'package:ideal/src/blocs/sacco/SaccoBlocProvider.dart';
import 'package:ideal/src/models/sacco.dart';
import 'package:ideal/src/screens/register_sacco/register_sacco.dart';
import 'package:ideal/src/screens/sacco/SaccoScreen.dart';

import '../../constants.dart';

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
    final SaccoBloc _bloc = SaccoBlocProvider.of(context).saccoBloc;
    return Scaffold(
      appBar: AppBar(
        title: Text("Saving Sacco Groups"),
        actions: [
          IconButton(
            onPressed: () {
              RegisterSaccoScreen.goToRegisterSaccoScreen(context);
            },
            icon: Icon(
              Icons.add,
              size: 32,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: _bloc.saccos(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  Sacco sacco =
                      Sacco.fromJson(snapshot.data.docs[index].data());
                  return SaccoInfoCard(sacco: sacco);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    height: 1,
                  );
                },
              );
            }

            return Text("Loading");
          },
        ),
      ),
    );
  }
}

class SaccoInfoCard extends StatelessWidget {
  const SaccoInfoCard({
    Key? key,
    required this.sacco,
  }) : super(key: key);

  final Sacco sacco;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => {SaccoScreen.goToSaccoScreen(context)},
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
              sacco.name,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: 18,
                  ),
            ),
            Container(
              padding: EdgeInsets.all(kDefaultPadding * .5),
              child: Text(
                "${sacco.members} members",
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
              sacco.description,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
            ),
            SaccoSummary(sacco: sacco)
          ],
        ),
      ),
    );
  }
}

class SaccoSummary extends StatelessWidget {
  const SaccoSummary({
    Key? key,
    required this.sacco,
  }) : super(key: key);

  final Sacco sacco;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Chip(
          label: Text(sacco.status),
          backgroundColor: Colors.greenAccent,
        ),
        Chip(label: Text("${sacco.price} ugx")),
        Chip(label: Text(sacco.frequency)),
        Chip(label: Text(sacco.location)),
      ],
    );
  }
}
