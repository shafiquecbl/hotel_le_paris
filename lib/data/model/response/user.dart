// ignore_for_file: file_names

class AppUser {
  AppUser(
      {this.id, this.name, this.email, this.phone, this.password, this.image});
  int? id;
  String? name, email, phone, password, image;

  factory AppUser.fromJson(Map<String, dynamic> json) => AppUser(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phoneNumber'],
        password: json['password'],
        image: json['image'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phoneNumber': phone,
        'password': password,
        'image': image,
      };
}
