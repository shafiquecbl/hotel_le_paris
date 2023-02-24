import 'package:flutter/material.dart';
import 'package:hotel_booking/common/icons.dart';
import 'package:hotel_booking/data/model/response/food.dart';
import 'package:hotel_booking/utils/network_image.dart';
import 'package:hotel_booking/utils/style.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListView.builder(
            itemCount: 10,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            itemBuilder: (context, index) {
              return _cartProductWidget(context, index);
            }),
      )),
    );
  }

  _cartProductWidget(BuildContext context, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(radius),
                child: CustomNetworkImage(url: breakfast.first.imageUrl!)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Chicken Burger'),
                SizedBox(height: 5),
                Text('Chicken Burger with cheese',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: fontWeightNormal)),
                SizedBox(height: 5),
                Text('\$10.00'),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Column(
            children: [
              CustomIcon(
                border: 5,
                icon: Icons.add,
                color: Theme.of(context).primaryColor,
                onTap: () {},
              ),
              const SizedBox(height: 5),
              const Text('1'),
              const SizedBox(height: 5),
              CustomIcon(
                border: 5,
                icon: Icons.remove,
                color: Theme.of(context).primaryColor,
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
