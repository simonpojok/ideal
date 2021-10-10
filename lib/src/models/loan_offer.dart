import 'package:ideal/src/models/user_model.dart';

class LoanOffer {
  double fromAmount;
  double toAmount;
  int rate;
  int duration;
  String range;
  String description;
  String userid;
  LocalUser? user;

  LoanOffer({
    required this.fromAmount,
    required this.toAmount,
    required this.rate,
    required this.duration,
    required this.range,
    required this.description,
    required this.userid,
  });

  LoanOffer.fromJson(Map<String, dynamic> loanOffer)
      : fromAmount = loanOffer["fromAmount"] ?? 0.0,
        toAmount = loanOffer["toAmount"] ?? 0.0,
        rate = loanOffer["rate"] ?? 0,
        duration = loanOffer["duration"] ?? 0,
        range = loanOffer["range"] ?? "Month",
        userid = loanOffer["userid"],
        user = LocalUser.fromJson(loanOffer["user"]),
        description = loanOffer["description"] ?? "...";

  Map<String, dynamic> toJson() => {
        'fromAmount': fromAmount,
        'toAmount': toAmount,
        'rate': rate,
        'duration': duration,
        'range': range,
        'description': description
      };
}
