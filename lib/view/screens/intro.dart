import 'package:flutter/material.dart';
import 'package:hotel_booking/helper/navigation.dart';
import 'package:hotel_booking/utils/images.dart';
import 'package:hotel_booking/view/base/button.dart';
import 'package:hotel_booking/view/screens/dashboard.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            Images.background,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Image.asset(
                Images.logo,
                width: MediaQuery.of(context).size.width,
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(
                          textColor: Theme.of(context).primaryColor,
                          color: Colors.white,
                          text: 'LOGIN',
                          onPressed: () {
                            launchScreen(const DashboardPage());
                          }),
                      const SizedBox(height: 20),
                      OutlineButton(
                        text: 'SIGN UP',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
