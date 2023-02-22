import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/common/textfield.dart';
import 'package:hotel_booking/data/model/food.dart';
import 'package:hotel_booking/utils/images.dart';
import 'package:hotel_booking/utils/network_image.dart';
import 'package:hotel_booking/view/base/food_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(15).copyWith(top: 5),
      child: Column(
        children: [
          Center(child: Image.asset(Images.logo, width: Get.width * 0.4)),
          const SizedBox(height: 10),
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: const CustomNetworkImage(
                        url:
                            'https://media.licdn.com/dms/image/D4D03AQEn19TZB9AK1w/profile-displayphoto-shrink_400_400/0/1664789524738?e=1682553600&v=beta&t=AfJ6iVi9ah3aH4KuqwNjl-_NRckzaLkCuDAPfm-KNps')),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Hello,'),
                  Text('Muhammad Shafique',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                CustomTextField(
                  padding: EdgeInsets.zero,
                  controller: search,
                  hintText: 'Search for hotels',
                  prefixIcon: const Icon(Icons.search_rounded),
                ),
                const SizedBox(height: 20),
                FoodViewHorizontal(title: 'Popular Drinks', foods: drinks),
                FoodViewHorizontal(title: 'Breakfast', foods: breakfast),
                // FoodViewHorizontal(title: 'Dinner', foods: dinner),
              ],
            ),
          ))
        ],
      ),
    ));
  }
}
