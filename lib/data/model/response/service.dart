class ServiceModel {
  ServiceModel({this.image, this.title, this.price, this.description});

  String? image;
  String? title;
  String? description;
  double? price;

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        image: json["image"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "price": price,
        "description": description,
      };
}

List<ServiceModel> services = [
  ServiceModel(
    image:
        'https://images.squarespace-cdn.com/content/v1/5992e51a6a49634687ed5b48/1580922272123-0OJXY8X8NRHZ2LM5PEFU/bouquet-fleurs-pinks-lesfleurs-andover-valentines-day-flowers+%281%29.jpg?format=2500w',
    title: 'Order Flower / Bouquets de Fleurs',
    price: 100,
    description:
        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc sit amet aliquam luctus, nisi nisl aliquet nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc sit amet aliquam luctus, nisi nisl aliquet nisl, eget aliquam nisl nisl sit amet nisl.''',
  ),
  ServiceModel(
    image:
        'https://images.squarespace-cdn.com/content/v1/5992e51a6a49634687ed5b48/1580922272123-0OJXY8X8NRHZ2LM5PEFU/bouquet-fleurs-pinks-lesfleurs-andover-valentines-day-flowers+%281%29.jpg?format=2500w',
    title: 'Order Flower / Bouquets de Fleurs',
    price: 100,
    description:
        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc sit amet aliquam luctus, nisi nisl aliquet nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc sit amet aliquam luctus, nisi nisl aliquet nisl, eget aliquam nisl nisl sit amet nisl.''',
  ),
  ServiceModel(
    image:
        'https://images.squarespace-cdn.com/content/v1/5992e51a6a49634687ed5b48/1580922272123-0OJXY8X8NRHZ2LM5PEFU/bouquet-fleurs-pinks-lesfleurs-andover-valentines-day-flowers+%281%29.jpg?format=2500w',
    title: 'Order Flower / Bouquets de Fleurs',
    price: 100,
    description:
        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc sit amet aliquam luctus, nisi nisl aliquet nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc sit amet aliquam luctus, nisi nisl aliquet nisl, eget aliquam nisl nisl sit amet nisl.''',
  ),
  ServiceModel(
    image:
        'https://images.squarespace-cdn.com/content/v1/5992e51a6a49634687ed5b48/1580922272123-0OJXY8X8NRHZ2LM5PEFU/bouquet-fleurs-pinks-lesfleurs-andover-valentines-day-flowers+%281%29.jpg?format=2500w',
    title: 'Order Flower / Bouquets de Fleurs',
    price: 100,
    description:
        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc sit amet aliquam luctus, nisi nisl aliquet nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc sit amet aliquam luctus, nisi nisl aliquet nisl, eget aliquam nisl nisl sit amet nisl.''',
  ),
  ServiceModel(
    image:
        'https://images.squarespace-cdn.com/content/v1/5992e51a6a49634687ed5b48/1580922272123-0OJXY8X8NRHZ2LM5PEFU/bouquet-fleurs-pinks-lesfleurs-andover-valentines-day-flowers+%281%29.jpg?format=2500w',
    title: 'Order Flower / Bouquets de Fleurs',
    price: 100,
    description:
        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc sit amet aliquam luctus, nisi nisl aliquet nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc sit amet aliquam luctus, nisi nisl aliquet nisl, eget aliquam nisl nisl sit amet nisl.''',
  ),
  ServiceModel(
    image:
        'https://images.squarespace-cdn.com/content/v1/5992e51a6a49634687ed5b48/1580922272123-0OJXY8X8NRHZ2LM5PEFU/bouquet-fleurs-pinks-lesfleurs-andover-valentines-day-flowers+%281%29.jpg?format=2500w',
    title: 'Order Flower / Bouquets de Fleurs',
    price: 100,
    description:
        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc sit amet aliquam luctus, nisi nisl aliquet nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc sit amet aliquam luctus, nisi nisl aliquet nisl, eget aliquam nisl nisl sit amet nisl.''',
  ),
];
