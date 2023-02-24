import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/controller/categories_controller.dart';
import 'package:hotel_booking/data/model/response/categories.dart';
import 'package:hotel_booking/utils/style.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(builder: (con) {
      return Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 20),
        child: SizedBox(
          height: getPixels(context, 40),
          child: ListView.builder(
              itemCount: con.categoryList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Categories category = con.categoryList[index];
                return Container(
                    height: getPixels(context, 40),
                    margin: const EdgeInsets.only(right: 15),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(radius),
                        color: Theme.of(context).cardColor),
                    child: Text(
                      category.title!,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 10),
                    ));
              }),
        ),
      );
    });
  }
}
