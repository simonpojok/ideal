import 'package:flutter/material.dart';
import 'package:ideal/src/constants.dart';

class UserProfileHeader extends StatelessWidget {
  const UserProfileHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: kPrimaryDarkColor,
      child: new Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: new Stack(fit: StackFit.loose, children: <Widget>[
              new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                      width: 140.0,
                      height: 140.0,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          image: new ExactAssetImage(
                              'assets/images/as.png'),
                          fit: BoxFit.cover,
                        ),
                      )),
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(top: 90.0, right: 100.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 25.0,
                        child: new Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )),
            ]),
          )
        ],
      ),
    );
  }
}