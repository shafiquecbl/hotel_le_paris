class Addons {
  Addons({this.id, this.name, this.price});

  int? id;
  String? name;
  double? price;

  factory Addons.fromJson(Map<String, dynamic> json) => Addons(
      id: json["id"], name: json["name"], price: json["price"].toDouble());

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
      };
}
