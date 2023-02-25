import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hotel_booking/common/button.dart';
import 'package:hotel_booking/common/icons.dart';
import 'package:hotel_booking/common/tabbutton.dart';
import 'package:hotel_booking/data/model/response/room.dart';
import 'package:hotel_booking/utils/icons.dart';
import 'package:hotel_booking/utils/network_image.dart';
import 'package:hotel_booking/utils/style.dart';
import 'package:url_launcher/url_launcher_string.dart';

class RoomDetailPage extends StatefulWidget {
  final Room room;
  const RoomDetailPage({required this.room, super.key});

  @override
  State<RoomDetailPage> createState() => _RoomDetailPageState();
}

class _RoomDetailPageState extends State<RoomDetailPage> {
  int _selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: CustomButton(text: 'Check Availablity', onPressed: () {}),
      ),
      body: Column(
        children: [
          SizedBox(
            height: getPixels(context, 250),
            child: Stack(
              children: [
                PageView.builder(
                    itemCount: widget.room.photos!.isEmpty
                        ? 1
                        : widget.room.photos!.length,
                    onPageChanged: (index) {
                      setState(() {
                        _selectIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Hero(
                          tag: widget.room.photos!.isEmpty
                              ? widget.room.title!
                              : widget.room.photos![index],
                          child: CustomNetworkImage(
                              url: widget.room.photos!.isEmpty
                                  ? ''
                                  : widget.room.photos![index]));
                    }),
                // dot indicator
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (var i = 0; i < widget.room.photos!.length; i++)
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            height: 7,
                            width: 7,
                            decoration: BoxDecoration(
                                color: i == _selectIndex
                                    ? Theme.of(context).primaryColor
                                    : null,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: i == _selectIndex
                                        ? Theme.of(context).primaryColor
                                        : Colors.white)),
                          ),
                      ]),
                ),
                // back button
                Positioned(
                  top: MediaQuery.of(context).padding.top + 1,
                  left: 0,
                  child: const CustomBackButton(),
                ),

                // favourite button
                Positioned(
                  top: MediaQuery.of(context).padding.top + 1,
                  right: 0,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomIcon(
                      iconSize: 26,
                      padding: 8,
                      icon: FFIcons.heart,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.room.title!,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    fontSize: 20,
                                    fontWeight: fontWeightSemiBold),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '\$${widget.room.price}',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  fontWeight: fontWeightBold,
                                  color: Theme.of(context).primaryColor),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // details
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(radius)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Details',
                            style: TextStyle(
                                fontSize: 16, fontWeight: fontWeightSemiBold),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _detailsWidget(
                                  '${widget.room.bed} beds', Icons.bed),
                              _detailsWidget('${widget.room.person} persons',
                                  FFIcons.user),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // facilities
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(radius)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Facilities',
                            style: TextStyle(
                                fontSize: 16, fontWeight: fontWeightSemiBold),
                          ),
                          const SizedBox(height: 10),
                          for (var item in widget.room.facilities!)
                            _facilitiesWidget(item.name!, item.image!),
                        ],
                      ),
                    ),
                    // desciption
                    const SizedBox(height: 20),
                    const Text(
                      'Description',
                      style: TextStyle(
                          fontSize: 16, fontWeight: fontWeightSemiBold),
                    ),
                    Html(
                      data: widget.room.description,
                      shrinkWrap: true,
                      style: {
                        'body': Style(
                            fontSize: const FontSize(12),
                            fontWeight: fontWeightNormal,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            color: Colors.black,
                            fontFamily: 'poppins'),
                      },
                      onLinkTap: (url, context, map, element) {
                        launchUrlString(url!);
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _detailsWidget(String text, IconData icon) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomIcon(
            icon: icon,
            iconSize: 20,
            padding: 5,
          ),
          const SizedBox(width: 5),
          Text(
            text,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      );

  _facilitiesWidget(String text, String image) => ListTile(
        contentPadding: const EdgeInsets.all(0),
        visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
        leading: Container(
          padding: const EdgeInsets.all(5),
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: CachedNetworkImage(imageUrl: image),
          ),
        ),
        title: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.subtitle2,
        ),
      );
}
