class Sacco {
  String name;
  String status;
  double price;
  String frequency;
  String location;
  String description;
  late int members;
  late String id;
  String banner;

  Sacco(this.name, this.status, this.price, this.frequency, this.location,
      this.description, this.banner);

  Sacco.fromJson(Map<String, dynamic> sacco)
      : name = sacco["name"],
        status = sacco["status"],
        price = sacco["price"],
        frequency = sacco["frequency"],
        location = sacco["location"],
        description = sacco["description"],
        members = sacco["members"],
        banner = sacco["banner"];

  Map<String, dynamic> toJson() => {
        'name': name,
        'status': status,
        'price': price,
        'frequency': frequency,
        'location': location,
        'description': description,
        'banner': banner
      };
}
