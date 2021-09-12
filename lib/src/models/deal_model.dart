import 'package:ideal/src/models/user_model.dart';

class Deal {
  String date;
  String description;
  String? id;
  String location;
  String frequency;
  double rate;
  double price;
  List<User>? emails;
  List<User>? offers;
  List<User>? sharers;
  List<User>? views;

  Deal({
    required this.date,
    required this.description,
    required this.location,
    required this.frequency,
    required this.rate,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      "date": date,
      "description": description,
      "location": location,
      "frequency": frequency,
      "rate": rate,
      "price": price,
      "emails": emails!.map((User user) => user.toMap()),
      "offers": offers!.map((User user) => user.toMap()),
      "sharers": sharers!.map((User user) => user.toMap()),
      "views": views!.map((User user) => user.toMap()),
    };
  }

  Deal.fromJson(Map<String, dynamic> deal)
      : date = deal["date"],
        description = deal["description"],
        location = deal["location"],
        frequency = deal["frequency"],
        rate = deal["rate"],
        price = deal["price"],
        emails = ((deal["emails"] as List<Map<String, dynamic>>)
                .map((Map<String, dynamic> user) => User.fromJson(user))
            as List<User>),
        offers = ((deal["offers"] as List<Map<String, dynamic>>)
                .map((Map<String, dynamic> user) => User.fromJson(user))
            as List<User>),
        sharers = ((deal["sharers"] as List<Map<String, dynamic>>)
                .map((Map<String, dynamic> user) => User.fromJson(user))
            as List<User>),
        views = ((deal["views"] as List<Map<String, dynamic>>)
                .map((Map<String, dynamic> user) => User.fromJson(user))
            as List<User>);
}
