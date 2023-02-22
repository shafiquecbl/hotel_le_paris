import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/utils/images.dart';
import 'package:hotel_booking/view/screens/cart/cart.dart';
import 'package:hotel_booking/view/screens/home/home.dart';
import 'package:hotel_booking/view/screens/rooms/rooms.dart';
import 'package:hotel_booking/view/screens/services/services.dart';
import 'package:hotel_booking/view/screens/settings/settings.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;
  List<Widget> pages = const [
    HomeScreen(),
    RoomsScreen(),
    CartScreen(),
    ServicesScreen(),
    SettingPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Theme.of(context).hintColor,
          backgroundColor: Theme.of(context).cardColor,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            _bottomItem(Images.home, 'home'.tr),
            _bottomItem(Images.rooms, 'rooms'.tr),
            _bottomItem(Images.cart, 'cart'.tr),
            _bottomItem(Images.servicesIcon, 'services'.tr),
            _bottomItem(Images.settings, 'account'.tr),
          ]),
    );
  }

  _bottomItem(String image, String label) => BottomNavigationBarItem(
      backgroundColor: Theme.of(context).cardColor,
      icon: Image.asset(
        image,
        width: 20,
        color: Theme.of(context).hintColor,
      ),
      activeIcon: Image.asset(
        image,
        width: 20,
        color: Theme.of(context).primaryColor,
      ),
      label: label);
}
