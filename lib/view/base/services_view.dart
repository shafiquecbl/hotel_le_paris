import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/common/icons.dart';
import 'package:hotel_booking/controller/service_controller.dart';
import 'package:hotel_booking/data/model/response/service.dart';
import 'package:hotel_booking/helper/navigation.dart';
import 'package:hotel_booking/utils/icons.dart';
import 'package:hotel_booking/utils/network_image.dart';
import 'package:hotel_booking/utils/style.dart';
import 'package:hotel_booking/view/screens/services/service_detail_page.dart';
import 'package:shimmer/shimmer.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ServiceController>(builder: (con) {
      return con.isLoading
          ? ListView.builder(
              itemCount: 6,
              padding: const EdgeInsets.only(top: 15),
              itemBuilder: (context, index) {
                return const ServiceWidgetShimmer();
              })
          : ListView.builder(
              itemCount: con.serviceList.length,
              padding: const EdgeInsets.only(top: 15),
              itemBuilder: (context, index) {
                return ServiceWidget(
                    service: con.serviceList[index], favourite: index.isOdd);
              });
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
          launchScreen(ServiceDetailPage(service: service));
        },
        child: Row(
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
                      tag: service.id!,
                      child: CustomNetworkImage(url: service.image))),
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
                          service.title!,
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
                    service.description!,
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

class ServiceWidgetShimmer extends StatelessWidget {
  const ServiceWidgetShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).cardColor,
      highlightColor: Theme.of(context).hintColor.withOpacity(0.2),
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(radius),
        ),
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
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: CustomIcon(
                    padding: 2,
                    icon: FFIcons.heartO,
                    color: Theme.of(context).cardColor,
                    iconColor: Theme.of(context).iconTheme.color,
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
                        child: Container(
                          height: 20,
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 20,
                        width: 50,
                        color: Theme.of(context).cardColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: 60,
                    color: Theme.of(context).cardColor,
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
