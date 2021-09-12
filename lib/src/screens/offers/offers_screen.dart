import 'package:flutter/material.dart';
import 'package:ideal/src/blocs/loan_offer/LoanOfferBlocProvider.dart';
import 'package:ideal/src/constants.dart';
import 'package:ideal/src/models/loan_offer.dart';
import 'package:ideal/src/screens/offer/OfferScreen.dart';

const requirements =
    "Sadly, there are many specific bank loan requirements that you’ll need to meet in order to qualify. In most cases, small business owners have difficult meeting all of them. Or, even if they do, the process takes too long, especially if they have an immediate business need. Inpost, we’ll detail what a typical bank will expect from a small business loan applicant. Once you’re finished reading this blog post, you can determine if this is the right financing option for your small business.";

class OffersScreen extends StatefulWidget {
  static const OFFERS_SCREEN_ROUTE = "/offers_screen_route";

  const OffersScreen({Key? key}) : super(key: key);

  @override
  _OffersScreenState createState() => _OffersScreenState();

  static void goToOffersScreen(BuildContext context) {
    Navigator.of(context).pushNamed(OFFERS_SCREEN_ROUTE);
  }
}

class _OffersScreenState extends State<OffersScreen> {
  double price = 100000;

  @override
  Widget build(BuildContext context) {
    final _bloc = LoanOfferBlocProvider.of(context).loanOfferBloc;

    return Scaffold(
      appBar: AppBar(
        title: Text("Offers"),
        actions: [
          IconButton(
              onPressed: () {
                OfferScreen.goToOfferScreen(context);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: SafeArea(
        child: StreamBuilder(
            stream: _bloc.loanOfferApi.getLoanOffers(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    LoanOffer offer =
                        LoanOffer.fromJson(snapshot.data.docs[index].data());
                    return LoanOfferItemCard(
                      offer: offer,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      height: 1,
                    );
                  },
                );
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: CircularProgressIndicator(
                      strokeWidth: 6,
                    ),
                  ),
                  Text(
                    "Loading...",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                  )
                ],
              );
            }),
      ),
    );
  }
}

class LoanOfferItemCard extends StatelessWidget {
  final LoanOffer offer;

  const LoanOfferItemCard({
    Key? key,
    required this.offer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Simon Peter O"),
          Row(
            children: [
              Chip(label: Text("${offer.duration} ${offer.range}")),
              SizedBox(
                width: 1,
              ),
              Chip(
                label: Text("${offer.rate}%"),
                backgroundColor: Colors.greenAccent,
              ),
            ],
          ),
        ],
      ),
      subtitle: Column(
        children: [
          Text(
            offer.description,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Colors.black45,
                  fontSize: 16,
                ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RichText(
                text: TextSpan(
                  text: "${offer.fromAmount}",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Colors.black54,
                      ),
                  children: [
                    TextSpan(
                      text: "\tUGX",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Colors.orangeAccent,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding * .5,
                ),
                child: Text(
                  "-",
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                ),
              ),
              RichText(
                text: TextSpan(
                  text: "${offer.toAmount}",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Colors.black54,
                      ),
                  children: [
                    TextSpan(
                      text: "\tUGX",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Colors.orangeAccent,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomCheckBox extends StatelessWidget {
  final String label;
  final checked;
  final Function(bool? value) onClick;

  const CustomCheckBox({
    Key? key,
    required this.label,
    this.checked,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Checkbox(
            value: checked,
            onChanged: onClick,
          ),
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .button!
                .copyWith(color: Colors.black54),
          )
        ],
      ),
    );
  }
}
