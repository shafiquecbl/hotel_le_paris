class FoodModel {
  FoodModel(
      {required this.imageUrl,
      required this.title,
      required this.price,
      required this.rating});

  String imageUrl;
  String title;
  double rating;
  double price;
}

// demo drinks
List<FoodModel> drinks = [
  FoodModel(
      imageUrl:
          'https://landportal.org/sites/landportal.org/files/Coca-Cola-Logo-2.jpg',
      title: 'Coca Cola',
      price: 2.99,
      rating: 4.5),
  FoodModel(
      imageUrl:
          'http://gomart.pk/image/cache/data/incoming/fanta-can-pack-24x300ml-gomart-pakistan-2801-500x500.jpg',
      title: 'Fanta',
      price: 2.99,
      rating: 4.5),
  FoodModel(
      imageUrl:
          'https://ucarecdn.com/65a5c249-0a78-43dd-b035-238311381538/-/crop/1581x888/0,30/-/preview/-/quality/lighter/-/format/auto/-/scale_crop/1920x1080/center/',
      title: 'Sprite',
      price: 2.99,
      rating: 4.5),
  FoodModel(
      imageUrl:
          'https://indianfood.com.sg/wp-content/uploads/2021/02/Pepsi-scaled.jpg',
      title: 'Pepsi',
      price: 2.99,
      rating: 4.5),
  FoodModel(
      imageUrl:
          'https://media.glamour.com/photos/612d343de274243a3defbc8f/master/w_2560%2Cc_limit/1225546255',
      title: 'Juice',
      price: 2.99,
      rating: 4.5),
];

// demo breakfast
List<FoodModel> breakfast = [
  FoodModel(
      imageUrl:
          'https://www.therecipespk.com/wp-content/uploads/2017/08/Mutton-Karahi.webp',
      title: 'Mutton Karahi',
      price: 2.99,
      rating: 4.5),
  FoodModel(
      imageUrl: 'https://i.ytimg.com/vi/-LCPenisXUE/maxresdefault.jpg',
      title: 'Dum Pukht',
      price: 2.99,
      rating: 4.5),
  FoodModel(
      imageUrl:
          'https://kfoods.com/images1/newrecipeicon/lamb-karahi-without-red-pepper_3978.jpg',
      title: 'Beaf Karahi',
      price: 2.99,
      rating: 4.5),
  FoodModel(
      imageUrl:
          'https://cdn.shopify.com/s/files/1/0447/7494/9025/articles/lndscpe.jpg?v=1662370766',
      title: 'Chicken Baryani',
      price: 2.99,
      rating: 4.5),
  FoodModel(
      imageUrl:
          'https://www.mirchitales.com/wp-content/uploads/2019/01/Chicken-Karahi-1.jpg',
      title: 'Chicken Karahi',
      price: 2.99,
      rating: 4.5)
];

// demo dinner
List<FoodModel> dinner = breakfast.reversed.toList();
