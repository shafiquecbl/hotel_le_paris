import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/utils/icons.dart';
import 'package:hotel_booking/view/screens/services/services.dart';
import 'package:hotel_booking/view/screens/settings/settings.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;
  List<Widget> pages = [
    const Text('Page 1'),
    const Text('Page 2'),
    const Text('Page 3'),
    const ServicesScreen(),
    const SettingPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
        ),
        child: BottomNavigationBar(
            iconSize: 26,
            currentIndex: _selectedIndex,
            backgroundColor: Theme.of(context).primaryColor,
            selectedItemColor: Colors.white,
            unselectedItemColor: Theme.of(context).disabledColor,
            type: BottomNavigationBarType.fixed,
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: [
              _bottomItem(FFIcons.home, 'home'.tr),
              _bottomItem(FFIcons.bookmark, 'rooms'.tr),
              _bottomItem(Icons.shopping_cart, 'cart'.tr),
              _bottomItem(FFIcons.grid, 'services'.tr),
              _bottomItem(FFIcons.settings, 'settings'.tr),
            ]),
      ),
    );
  }

  _bottomItem(IconData icon, String label) => BottomNavigationBarItem(
      backgroundColor: Theme.of(context).primaryColor,
      icon: Icon(icon),
      label: label);
}
