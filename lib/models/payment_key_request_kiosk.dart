class PaymentKeyRequestKiosk {
  String token;

  PaymentKeyRequestKiosk({
    required this.token,
  });

  factory PaymentKeyRequestKiosk.fromJson(Map<String, dynamic> json) => PaymentKeyRequestKiosk(
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
  };
}
