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

  Sacco(
      {required this.name,
      required this.status,
      required this.price,
      required this.frequency,
      required this.location,
      required this.description,
      required this.banner});

  Sacco.fromJson(Map<String, dynamic> sacco)
      : name = sacco["name"] ?? "",
        status = sacco["status"] ?? "",
        price = sacco["price"] ?? 0,
        frequency = sacco["frequency"] ?? "",
        location = sacco["location"] ?? "",
        description = sacco["description"] ?? "",
        members = sacco["members"] ?? 0,
        banner = sacco["banner"] ?? "";

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
