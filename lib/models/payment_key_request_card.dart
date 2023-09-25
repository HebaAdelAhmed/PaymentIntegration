class PaymentKeyRequestCard {
  String token;

  PaymentKeyRequestCard({
    required this.token,
  });

  factory PaymentKeyRequestCard.fromJson(Map<String, dynamic> json) => PaymentKeyRequestCard(
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
  };
}