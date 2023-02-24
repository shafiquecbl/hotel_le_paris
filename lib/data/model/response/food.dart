import 'package:hotel_booking/data/model/response/addons.dart';

class FoodModel {
  FoodModel(
      {this.id,
      this.category,
      this.subCategory,
      this.imageUrl,
      this.title,
      this.description,
      this.price,
      this.rating,
      this.addons});

  int? id, subCategory, category;
  String? imageUrl;
  String? title, description;
  double? rating;
  double? price;
  List<Addons>? addons;

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        id: json["id"],
        category: json["category_id"],
        subCategory: json["subcategory_id"],
        imageUrl: json["image"],
        title: json["title"],
        price: double.parse(json["price"].toString()),
        rating: json["rating"],
        description: json["description"],
        addons: json["addons"] != null
            ? List<Addons>.from(json["addons"].map((x) => Addons.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": category,
        "subcategory_id": subCategory,
        "image": imageUrl,
        "title": title,
        "price": price,
        "rating": rating,
        "description": description,
        "addons": addons != null
            ? List<Addons>.from(addons!.map((x) => x.toJson()))
            : null,
      };
}
