// ignore_for_file: file_names

import 'dart:convert';

class AppUser {
  AppUser(
      {this.name,
      this.id,
      this.email,
      this.image,
      this.dob,
      this.blood,
      this.phoneNumber,
      this.isPremium,
      this.bikeType,
      this.coverImage,
      this.medicalCondition,
      this.emergencyContact,
      this.licenceCountry,
      this.licenseCategory,
      this.milage});
  int? id;
  String? name,
      email,
      dob,
      blood,
      phoneNumber,
      image,
      coverImage,
      bikeType,
      emergencyContact,
      medicalCondition,
      milage,
      licenseCategory;
  bool? isPremium;
  UserCountry? licenceCountry;

  factory AppUser.fromMap(Map<String, dynamic> json) => AppUser(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      email: json["email"],
      dob: json["dob"],
      blood: json["blood"],
      phoneNumber: json["phoneNumber"],
      isPremium: json["isPremium"] == 1 ? true : false,
      milage: json["mileage"],
      bikeType: json["bikeType"],
      emergencyContact: json["emergencyContact"],
      medicalCondition: json["medicalCondition"],
      licenceCountry: json["licenceCountry"] == null
          ? null
          : UserCountry.fromMap(jsonDecode(json["licenceCountry"])),
      licenseCategory: json["licenseCategory"],
      coverImage: json["coverImage"]);

  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "dob": dob,
        "blood": blood,
        "phoneNumber": phoneNumber,
        "isPremium": isPremium,
        "image": image,
        "coverImage": coverImage,
        "mileage": milage,
        "medicalCondition": medicalCondition,
        "emergencyContact": emergencyContact,
        "bikeType": bikeType,
        "licenceCountry":
            licenceCountry == null ? null : licenceCountry!.toMap(),
        "licenseCategory": licenseCategory
      };
}

class UserCountry {
  UserCountry({this.country, this.code});

  String? country, code;

  factory UserCountry.fromMap(Map<String, dynamic> json) =>
      UserCountry(country: json["country"], code: json["code"]);

  Map<String, dynamic> toMap() => {"country": country, "code": code};
}
