class ServiceModel {
  ServiceModel(
      {required this.imageUrl,
      required this.title,
      required this.price,
      required this.description});

  String imageUrl;
  String title;
  String description;
  double price;

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        imageUrl: json["imageUrl"],
        title: json["title"],
        price: json["price"].toDouble(),
        description: json["description"],
      );
}

List<ServiceModel> services = [
  ServiceModel(
    imageUrl:
        'https://images.squarespace-cdn.com/content/v1/5992e51a6a49634687ed5b48/1580922272123-0OJXY8X8NRHZ2LM5PEFU/bouquet-fleurs-pinks-lesfleurs-andover-valentines-day-flowers+%281%29.jpg?format=2500w',
    title: 'Order Flower / Bouquets de Fleurs',
    price: 100,
    description:
        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc sit amet aliquam luctus, nisi nisl aliquet nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc sit amet aliquam luctus, nisi nisl aliquet nisl, eget aliquam nisl nisl sit amet nisl.''',
  ),
  ServiceModel(
    imageUrl:
        'https://images.squarespace-cdn.com/content/v1/5992e51a6a49634687ed5b48/1580922272123-0OJXY8X8NRHZ2LM5PEFU/bouquet-fleurs-pinks-lesfleurs-andover-valentines-day-flowers+%281%29.jpg?format=2500w',
    title: 'Order Flower / Bouquets de Fleurs',
    price: 100,
    description:
        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc sit amet aliquam luctus, nisi nisl aliquet nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc sit amet aliquam luctus, nisi nisl aliquet nisl, eget aliquam nisl nisl sit amet nisl.''',
  ),
  ServiceModel(
    imageUrl:
        'https://images.squarespace-cdn.com/content/v1/5992e51a6a49634687ed5b48/1580922272123-0OJXY8X8NRHZ2LM5PEFU/bouquet-fleurs-pinks-lesfleurs-andover-valentines-day-flowers+%281%29.jpg?format=2500w',
    title: 'Order Flower / Bouquets de Fleurs',
    price: 100,
    description:
        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc sit amet aliquam luctus, nisi nisl aliquet nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc sit amet aliquam luctus, nisi nisl aliquet nisl, eget aliquam nisl nisl sit amet nisl.''',
  ),
  ServiceModel(
    imageUrl:
        'https://images.squarespace-cdn.com/content/v1/5992e51a6a49634687ed5b48/1580922272123-0OJXY8X8NRHZ2LM5PEFU/bouquet-fleurs-pinks-lesfleurs-andover-valentines-day-flowers+%281%29.jpg?format=2500w',
    title: 'Order Flower / Bouquets de Fleurs',
    price: 100,
    description:
        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc sit amet aliquam luctus, nisi nisl aliquet nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc sit amet aliquam luctus, nisi nisl aliquet nisl, eget aliquam nisl nisl sit amet nisl.''',
  ),
  ServiceModel(
    imageUrl:
        'https://images.squarespace-cdn.com/content/v1/5992e51a6a49634687ed5b48/1580922272123-0OJXY8X8NRHZ2LM5PEFU/bouquet-fleurs-pinks-lesfleurs-andover-valentines-day-flowers+%281%29.jpg?format=2500w',
    title: 'Order Flower / Bouquets de Fleurs',
    price: 100,
    description:
        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc sit amet aliquam luctus, nisi nisl aliquet nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc sit amet aliquam luctus, nisi nisl aliquet nisl, eget aliquam nisl nisl sit amet nisl.''',
  ),
  ServiceModel(
    imageUrl:
        'https://images.squarespace-cdn.com/content/v1/5992e51a6a49634687ed5b48/1580922272123-0OJXY8X8NRHZ2LM5PEFU/bouquet-fleurs-pinks-lesfleurs-andover-valentines-day-flowers+%281%29.jpg?format=2500w',
    title: 'Order Flower / Bouquets de Fleurs',
    price: 100,
    description:
        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc sit amet aliquam luctus, nisi nisl aliquet nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc sit amet aliquam luctus, nisi nisl aliquet nisl, eget aliquam nisl nisl sit amet nisl.''',
  ),
];
