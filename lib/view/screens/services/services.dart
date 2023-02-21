import 'package:flutter/material.dart';
import 'package:hotel_booking/utils/images.dart';
import 'package:hotel_booking/utils/style.dart';
import 'package:hotel_booking/view/base/service_widget.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(Images.services, fit: BoxFit.cover),
        Container(color: Colors.white.withOpacity(0.3)),
        Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.13),
            // title,
            Text('Services',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.black, fontSize: getPixels(context, 34))),
          ],
        ),
        Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50)),
            ),
            child: ListView(
              padding: const EdgeInsets.only(top: 10),
              children: const [
                ServicesWidget(text: 'Shuttle Service'),
                ServicesWidget(text: 'In-Room Features'),
                ServicesWidget(text: 'Other Services')
              ],
            ))
      ],
    ));
  }
}
