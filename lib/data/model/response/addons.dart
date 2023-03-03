class Addon {
  Addon({this.id, this.name, this.price});

  int? id;
  String? name;
  double? price;

  factory Addon.fromJson(Map<String, dynamic> json) => Addon(
      id: json["id"], name: json["name"], price: json["price"].toDouble());

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
      };
}
