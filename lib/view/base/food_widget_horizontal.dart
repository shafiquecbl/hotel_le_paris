import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/common/icons.dart';
import 'package:hotel_booking/data/model/food.dart';
import 'package:hotel_booking/utils/icons.dart';
import 'package:hotel_booking/utils/images.dart';
import 'package:hotel_booking/utils/network_image.dart';
import 'package:hotel_booking/utils/style.dart';

class FoodViewHorizontal extends StatelessWidget {
  final String title;
  final bool food;
  final List<FoodModel> foods;
  const FoodViewHorizontal(
      {required this.title, required this.foods, this.food = true, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(Images.medal),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'View All',
                style: TextStyle(
                    fontSize: 12, color: Theme.of(context).primaryColor),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: Get.width / (food ? 2.35 : 2.4),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foods.length,
                itemBuilder: (context, index) {
                  return FoodWidgetHorizontal(
                      food: foods[index],
                      discount: index.isEven,
                      favourite: index.isEven,
                      isLast: index == foods.length - 1);
                }),
          ),
        ],
      ),
    );
  }
}

class FoodWidgetHorizontal extends StatelessWidget {
  final FoodModel food;
  final bool discount;
  final bool favourite;
  final bool isLast;
  const FoodWidgetHorizontal(
      {required this.food,
      required this.discount,
      required this.favourite,
      this.isLast = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: isLast ? 0 : 15),
      child: Container(
        width: Get.width / 2.6,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(radius)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Get.width / 2.6,
              height: Get.width / 3.7,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(radius),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(radius),
                  child: CustomNetworkImage(url: food.imageUrl)),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  child: Text(
                    food.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(radius),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        FFIcons.star,
                        color: Colors.orange,
                        size: 15,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        food.rating.toString(),
                        style: const TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(
                  // price
                  '\$ ${food.price}',
                  style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                CustomIcon(
                  padding: 2,
                  icon: Icons.add,
                  iconSize: 16,
                  color: Theme.of(context).primaryColor,
                  iconColor: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
