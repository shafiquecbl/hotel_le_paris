import 'package:flutter/material.dart';
import 'package:hotel_booking/common/tabbutton.dart';
import 'package:hotel_booking/controller/rooms_controller.dart';
import 'package:hotel_booking/view/base/rooms_view.dart';

class RoomsScreen extends StatefulWidget {
  const RoomsScreen({super.key});

  @override
  State<RoomsScreen> createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    initAllData();
    super.initState();
  }

  initAllData({bool reload = false}) async {
    await RoomsController.to.init(reload: reload);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rooms'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: Row(
                  children: [
                    AnimatedTabButton(
                      text: 'All Rooms',
                      selected: _selectedIndex == 0,
                      onTap: () {
                        setState(() {
                          _selectedIndex = 0;
                        });
                      },
                    ),
                    const SizedBox(width: 10),
                    AnimatedTabButton(
                      text: 'Favourites',
                      selected: _selectedIndex == 1,
                      onTap: () {
                        setState(() {
                          _selectedIndex = 1;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
                child: RefreshIndicator(
                    onRefresh: () {
                      initAllData(reload: true);
                      return Future.value();
                    },
                    child: const RoomView())),
          ],
        ),
      )),
    );
  }
}
