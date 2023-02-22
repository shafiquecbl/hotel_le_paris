import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hotel_booking/common/button.dart';
import 'package:hotel_booking/common/icons.dart';
import 'package:hotel_booking/common/tabbutton.dart';
import 'package:hotel_booking/data/model/room.dart';
import 'package:hotel_booking/utils/icons.dart';
import 'package:hotel_booking/utils/network_image.dart';
import 'package:hotel_booking/utils/style.dart';
import 'package:url_launcher/url_launcher_string.dart';

class RoomDetailPage extends StatefulWidget {
  final RoomModel room;
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
                    itemCount: rooms.length,
                    onPageChanged: (index) {
                      setState(() {
                        _selectIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Hero(
                          tag: rooms[index].imageUrl,
                          child:
                              CustomNetworkImage(url: rooms[index].imageUrl));
                    }),
                // dot indicator
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (var i = 0; i < rooms.length; i++)
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
                            widget.room.title,
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
                          const SizedBox(height: 20),
                          GridView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10),
                            children: [
                              _facilitiesWidget('AC', Icons.bed),
                              _facilitiesWidget('Television', FFIcons.user),
                              _facilitiesWidget('Bathtub', Icons.bed),
                              _facilitiesWidget('Wifi', FFIcons.wifi),
                              _facilitiesWidget(
                                  'Telephone', Icons.call_rounded),
                              _facilitiesWidget('Safe', FFIcons.user),
                              _facilitiesWidget(
                                  '${widget.room.bed} beds', Icons.bed),
                              _facilitiesWidget('${widget.room.person} persons',
                                  FFIcons.user),
                            ],
                          ),
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
                      data: '''
          <p> For this motorcycle bookings are&nbsp;<strong>non-refundable</strong>&nbsp;once accepted.</p>
          
          <p>This motorbike requires a licence category&nbsp;<strong>A</strong>, or equivalent.</p>
          
          <p>You&#39;ll need to be at least&nbsp;<strong>21 years old</strong>&nbsp;to rent it with 24 months driving experience.</p>
          
          <p>A&nbsp;<strong>refundable</strong>&nbsp;security-deposit is required (4.618 &euro; credit/debit-card ) to pay at the destination.</p>
          
          <p>This motorbike includes&nbsp;<strong>unlimited mileage</strong>&nbsp;per day in the price.</p>
          
          <p>Delivery/Collection services are for the&nbsp;<strong>San Francisco</strong>&nbsp;area, and discretionary.</p>
          
          <p>The rental company&nbsp;<strong>does not allow</strong>&nbsp;crossing country borders.</p>
          
          <p>Free inclusions and paid add-ons are subject to availability.</p>
          
          <p>We are here for you! If you have any questions or requirements,&nbsp;contact us.</p>
          ''',
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

  _facilitiesWidget(String text, IconData icon) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomIcon(
            icon: icon,
            iconSize: 20,
            padding: 5,
          ),
          const SizedBox(height: 5),
          Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      );
}
