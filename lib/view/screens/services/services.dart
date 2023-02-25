import 'package:flutter/material.dart';
import 'package:hotel_booking/common/tabbutton.dart';
import 'package:hotel_booking/controller/service_controller.dart';
import 'package:hotel_booking/view/base/services_view.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  int _selectedIndex = 0;
  @override
  void initState() {
    initAllData();
    super.initState();
  }

  initAllData({bool reload = false}) async {
    await ServiceController.to.init(reload: reload);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Services'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10).copyWith(top: 0),
        child: RefreshIndicator(
            onRefresh: () {
              initAllData(reload: true);
              return Future.value();
            },
            child: const ServicesView()),
      ),
    );
  }
}
