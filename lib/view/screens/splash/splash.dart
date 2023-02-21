import 'package:flutter/material.dart';
import 'package:hotel_booking/helper/navigation.dart';
import 'package:hotel_booking/utils/images.dart';
import '../intro/intro.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double initialWidth = 300;
  double initialHeight = 300;
  double borderRadius = 300;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      changeSize();
    });
    super.initState();
  }

  changeSize() {
    setState(() {
      initialWidth = 270;
      initialHeight = 270;
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          borderRadius = 0;
          initialWidth = MediaQuery.of(context).size.width;
          initialHeight = MediaQuery.of(context).size.height;
          Future.delayed(const Duration(milliseconds: 325), () {
            launchScreen(const IntroPage(),
                duration: const Duration(milliseconds: 500));
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: AnimatedContainer(
        width: initialWidth,
        height: initialHeight,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(borderRadius)),
        child: Center(
          child: Image.asset(Images.logoWhite, width: 260),
        ),
      )),
    );
  }
}
