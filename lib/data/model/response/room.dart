class RoomModel {
  RoomModel(
      {required this.imageUrl,
      required this.title,
      required this.price,
      required this.bed,
      required this.person,
      required this.facilities});

  String imageUrl;
  String title;
  int person;
  int bed;
  List<String> facilities;
  double price;

  factory RoomModel.fromJson(Map<String, dynamic> json) => RoomModel(
      imageUrl: json["imageUrl"],
      title: json["title"],
      price: json["price"].toDouble(),
      person: json["person"],
      bed: json["bed"],
      facilities: json["facilities"]);
}

// demo rooms
List<RoomModel> rooms = [
  RoomModel(
      imageUrl:
          'https://www.eastparchotel.com/wp-content/uploads/2017/09/Deluxe-Room-2-3-scaled.jpg',
      title: 'Deluxe Twin',
      price: 100,
      person: 2,
      bed: 2,
      facilities: [
        'AC',
        'Room Service',
        'Free Wifi',
        'TV',
        'Breakfast',
        'Parking'
      ]),
  RoomModel(
      imageUrl:
          'https://www.arenabeachmaldives.com/wp-content/uploads/2020/01/Deluxe-Double-room-with-Seaview.jpg',
      title: 'Deluxe Double',
      price: 100,
      person: 2,
      bed: 2,
      facilities: [
        'AC',
        'Room Service',
        'Free Wifi',
        'TV',
        'Breakfast',
        'Parking'
      ]),
  RoomModel(
      imageUrl:
          'https://hiltonsfo.com/wp-content/uploads/2018/08/HSFRooms2014LARGE-4.jpg',
      title: 'Deluxe King',
      price: 100,
      person: 2,
      bed: 2,
      facilities: [
        'AC',
        'Room Service',
        'Free Wifi',
        'TV',
        'Breakfast',
        'Parking'
      ]),
  RoomModel(
      imageUrl:
          'https://www.eastparchotel.com/wp-content/uploads/2017/09/Deluxe-Room-2-3-scaled.jpg',
      title: 'Deluxe Twin',
      price: 100,
      person: 2,
      bed: 2,
      facilities: [
        'AC',
        'Room Service',
        'Free Wifi',
        'TV',
        'Breakfast',
        'Parking'
      ]),
  RoomModel(
      imageUrl:
          'https://www.arenabeachmaldives.com/wp-content/uploads/2020/01/Deluxe-Double-room-with-Seaview.jpg',
      title: 'Deluxe Double',
      price: 100,
      person: 2,
      bed: 2,
      facilities: [
        'AC',
        'Room Service',
        'Free Wifi',
        'TV',
        'Breakfast',
        'Parking'
      ]),
  RoomModel(
      imageUrl:
          'https://hiltonsfo.com/wp-content/uploads/2018/08/HSFRooms2014LARGE-4.jpg',
      title: 'Deluxe King',
      price: 100,
      person: 2,
      bed: 2,
      facilities: [
        'AC',
        'Room Service',
        'Free Wifi',
        'TV',
        'Breakfast',
        'Parking'
      ]),
];
