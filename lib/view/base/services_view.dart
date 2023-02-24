import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/common/icons.dart';
import 'package:hotel_booking/data/model/response/service.dart';
import 'package:hotel_booking/utils/icons.dart';
import 'package:hotel_booking/utils/network_image.dart';
import 'package:hotel_booking/utils/style.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: services.length,
        padding: const EdgeInsets.only(top: 15),
        itemBuilder: (context, index) {
          return ServiceWidget(
              service: services[index], favourite: index.isOdd);
        });
  }
}

class ServiceWidget extends StatelessWidget {
  final ServiceModel service;
  final bool favourite;
  const ServiceWidget(
      {required this.service, required this.favourite, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: InkWell(
        onTap: () {
          // launchScreen(RoomDetailPage(room: room));
        },
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: Get.width / 3,
                  height: Get.width / 3.9,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(radius),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(radius),
                      child: Hero(
                          tag: service.imageUrl,
                          child: CustomNetworkImage(url: service.imageUrl))),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: CustomIcon(
                    padding: 2,
                    icon: favourite ? FFIcons.heart : FFIcons.heartO,
                    color: Theme.of(context).cardColor,
                    iconColor: favourite
                        ? Colors.red
                        : Theme.of(context).iconTheme.color,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          service.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        // price
                        '\$${service.price}',
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    service.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: fontWeightNormal,
                        fontSize: 12,
                        color: Theme.of(context).hintColor),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
