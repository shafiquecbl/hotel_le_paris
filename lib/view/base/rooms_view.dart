import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/common/icons.dart';
import 'package:hotel_booking/data/model/room.dart';
import 'package:hotel_booking/helper/navigation.dart';
import 'package:hotel_booking/utils/icons.dart';
import 'package:hotel_booking/utils/network_image.dart';
import 'package:hotel_booking/utils/style.dart';
import 'package:hotel_booking/view/screens/rooms/room_detail_page.dart';

class RoomView extends StatelessWidget {
  const RoomView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        padding: const EdgeInsets.only(top: 15),
        itemBuilder: (context, index) {
          return RoomWidget(room: rooms[index], favourite: index.isOdd);
        });
  }
}

class RoomWidget extends StatelessWidget {
  final RoomModel room;
  final bool favourite;
  const RoomWidget({required this.room, required this.favourite, super.key});

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
          launchScreen(RoomDetailPage(room: room));
        },
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: Get.width / 3,
                  height: Get.width / 4.5,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(radius),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(radius),
                      child: Hero(
                          tag: room.imageUrl,
                          child: CustomNetworkImage(url: room.imageUrl))),
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
                          room.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        // price
                        '\$${room.price}',
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${room.person} person, ${room.bed} bed',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 12, color: Theme.of(context).hintColor),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    room.facilities.join(', ').toString(),
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
