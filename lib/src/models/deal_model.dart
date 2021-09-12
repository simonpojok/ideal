import 'package:ideal/src/models/user_model.dart';

class Deal {
  String? userId;
  String date;
  String description;
  String? id;
  String location;
  String frequency;
  double rate;
  double price;
  List<DealEmail> emails = [];
  List<DealOffer> offers = [];
  List<DealShare> sharers = [];
  List<DealView> views = [];

  Deal({
    required this.date,
    required this.description,
    required this.location,
    required this.frequency,
    required this.rate,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      "date": date,
      "description": description,
      "location": location,
      "frequency": frequency,
      "rate": rate,
      "price": price,
      "emails": emails.map((DealEmail user) => user.toMap()),
      "offers": offers.map((DealOffer offer) => offer.toMap()),
      "sharers": sharers.map((DealShare share) => share.toMap()),
      "views": views.map((DealView dealView) => dealView.toMap()),
      "userId": userId
    };
  }

  Deal.fromJson(Map<String, dynamic> deal)
      : date = deal["date"],
        userId = deal["userId"],
        description = deal["description"],
        location = deal["location"],
        frequency = deal["frequency"],
        rate = deal["rate"],
        price = deal["price"],
        emails = ((deal["emails"] as List<Map<String, dynamic>>).map(
                (Map<String, dynamic> dealMail) => DealEmail.fromJson(dealMail))
            as List<DealEmail>),
        offers = ((deal["offers"] as List<Map<String, dynamic>>)
                .map((Map<String, dynamic> offer) => DealOffer.fromJson(offer))
            as List<DealOffer>),
        sharers = ((deal["sharers"] as List<Map<String, dynamic>>)
                .map((Map<String, dynamic> share) => DealShare.fromJson(share))
            as List<DealShare>),
        views = ((deal["views"] as List<Map<String, dynamic>>).map(
                (Map<String, dynamic> dealView) => DealView.fromJson(dealView))
            as List<DealView>);
}

class DealView {
  User user;
  String date;

  DealView({required this.user, required this.date});

  DealView.fromJson(Map<String, dynamic> dealView)
      : user = User.fromJson(dealView["user"]),
        date = dealView["date"];

  Map<String, dynamic> toMap() {
    return {
      "user": user.toMap(),
      "date": date,
    };
  }
}

class DealEmail {
  User user;
  String date;
  String to;
  String body;
  String title;

  DealEmail({
    required this.user,
    required this.date,
    required this.body,
    required this.to,
    required this.title,
  });

  DealEmail.fromJson(Map<String, dynamic> email)
      : user = User.fromJson(email["user"]),
        date = email["date"],
        to = email["to"],
        body = email["body"],
        title = email["title"];

  Map<String, dynamic> toMap() {
    return {
      "user": user.toMap(),
      "date": date,
      "to": to,
      "body": body,
      "title": title
    };
  }
}

class DealOffer {
  User user;
  double price;
  String date;
  double rate;
  String frequency;

  DealOffer.fromJson(Map<String, dynamic> dealOffer)
      : user = User.fromJson(dealOffer["user"]),
        price = dealOffer["price"],
        date = dealOffer["date"],
        rate = dealOffer["rate"],
        frequency = dealOffer["frequency"];

  Map<String, dynamic> toMap() {
    return {
      "user": user.toMap(),
      "price": price,
      "date": date,
      "rate": rate,
      "frequency": frequency
    };
  }
}

class DealShare {
  User user;
  String date;
  String message;
  User to;

  DealShare.fromJson(Map<String, dynamic> share)
      : user = User.fromJson(share["user"]),
        date = share["date"],
        message = share["message"],
        to = User.fromJson(share["to"]);

  Map<String, dynamic> toMap() {
    return {
      "user": user.toMap(),
      "date": date,
      "message": message,
      "to": to,
    };
  }
}
