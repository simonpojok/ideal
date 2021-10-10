import 'package:flutter/material.dart';
import 'package:ideal/src/blocs/deal/DealBlocProvider.dart';
import 'package:ideal/src/constants.dart';
import 'package:ideal/src/models/deal_model.dart';
import 'package:ideal/src/screens/deal/deal_detail.dart';
import 'package:ideal/src/screens/deal_create/create_deal_screen.dart';
import 'package:ideal/src/screens/deals/widget/deal_tile.dart';
import 'package:ideal/src/screens/widgets/stream_loading_indicator.dart';
import 'package:intl/intl.dart';

class DealsScreen extends StatefulWidget {
  static const DEALS_SCREEN = "/DealsListScreen";
  static const USER_DEALS_SCREEN = "/DealsListScreen";
  static const DEALS_LIST_KEY = ValueKey("DealsListScreen");
  final bool userDeals;

  const DealsScreen({Key? key, this.userDeals = false}) : super(key: key);

  @override
  _DealsScreenState createState() => _DealsScreenState();

  static void goToDealsScreen(BuildContext context) {
    Navigator.of(context).pushNamed(DEALS_SCREEN);
  }

  static void goToUserDealsScreen(BuildContext context) {
    Navigator.of(context).pushNamed(USER_DEALS_SCREEN);
  }
}

class _DealsScreenState extends State<DealsScreen> {
  @override
  Widget build(BuildContext context) {
    final service = DealBlocProvider.of(context).dealBloc.dealApi;
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: Icon(
                Icons.search,
                size: 25,
                color: Theme.of(context).primaryTextTheme.bodyText1!.color,
              ),
              hintText: "Search deals",
              hintStyle: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(
                    fontSize: 18,
                    color: Colors.white12,
                  ),
            ),
            style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(
                  fontSize: 18,
                ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              CreateDealScreen.goToCreateDealScreen(context);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: StreamBuilder(
          stream: service.getDeals(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  Deal deal = Deal.fromJson(snapshot.data.docs[index].data());
                  return DealListTile(
                    deal: deal,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    height: 1,
                  );
                },
              );
            }
            return StreamLoadingIndicator();
          }),
    );
  }
}
