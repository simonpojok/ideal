import 'package:flutter/material.dart';

import '../../../constants.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
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
                      hintStyle:
                          Theme.of(context).textTheme.bodyText2!.copyWith(
                                color: Colors.black45,
                                fontSize: 18,
                              ),
                      border: InputBorder.none,
                    ),
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
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
    );
  }
}
