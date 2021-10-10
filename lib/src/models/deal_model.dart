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
  LocalUser user;

  Deal(
      {required this.date,
      required this.description,
      required this.location,
      required this.frequency,
      required this.rate,
      required this.price,
      required this.user});

  Map<String, dynamic> toJson() {
    return {
      "date": date,
      "description": description,
      "location": location,
      "frequency": frequency,
      "rate": rate,
      "price": price,
      "emails": emails.map((DealEmail user) => user.toMap()).toList(),
      "offers": offers.map((DealOffer offer) => offer.toMap()).toList(),
      "sharers": sharers.map((DealShare share) => share.toMap()).toList(),
      "views": views.map((DealView dealView) => dealView.toMap()).toList(),
      "userId": userId,
      "user": user.toMap()
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
        user = LocalUser.fromJson(deal["user"]),
        emails = (deal["emails"] as List<dynamic>)
            .map((e) => DealEmail.fromJson(e))
            .toList(),
        offers = (deal["offers"] as List<dynamic>)
            .map((e) => DealOffer.fromJson(e))
            .toList(),
        sharers = (deal["sharers"] as List<dynamic>)
            .map((e) => DealShare.fromJson(e))
            .toList(),
        views = (deal["views"] as List<dynamic>)
            .map((e) => DealView.fromJson(e))
            .toList();
}

class DealView {
  LocalUser user;
  String date;

  DealView({required this.user, required this.date});

  DealView.fromJson(Map<String, dynamic> dealView)
      : user = LocalUser.fromJson(dealView["user"]),
        date = dealView["date"];

  Map<String, dynamic> toMap() {
    return {
      "user": user.toMap(),
      "date": date,
    };
  }
}

class DealEmail {
  LocalUser user;
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
      : user = LocalUser.fromJson(email["user"]),
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
  LocalUser user;
  double price;
  String date;
  double rate;
  String frequency;

  DealOffer.fromJson(Map<String, dynamic> dealOffer)
      : user = LocalUser.fromJson(dealOffer["user"]),
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
  LocalUser user;
  String date;
  String message;
  LocalUser to;

  DealShare.fromJson(Map<String, dynamic> share)
      : user = LocalUser.fromJson(share["user"]),
        date = share["date"],
        message = share["message"],
        to = LocalUser.fromJson(share["to"]);

  Map<String, dynamic> toMap() {
    return {
      "user": user.toMap(),
      "date": date,
      "message": message,
      "to": to,
    };
  }
}
