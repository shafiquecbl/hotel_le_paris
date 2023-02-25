import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/controller/localization_controller.dart';

import '../utils/icons.dart';
import 'icons.dart';

class CustomBackButton extends StatelessWidget {
  final Function()? onTap;
  const CustomBackButton({this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8)
          .copyWith(left: !isLtr ? 0 : 16, right: !isLtr ? 16 : 0),
      child: CustomIcon(
        icon: FFIcons.leftArrow2,
        iconSize: 28,
        border: 8,
        onTap: onTap ?? () => Navigator.pop(context),
      ),
    );
  }
}

class AnimatedTabButton extends StatelessWidget {
  final String text;
  final bool selected;
  final Function()? onTap;
  const AnimatedTabButton(
      {required this.text,
      required this.onTap,
      this.selected = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 45,
          decoration: BoxDecoration(
            color: selected
                ? Theme.of(context).scaffoldBackgroundColor
                : Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: selected
                ? [
                    BoxShadow(
                      color: Theme.of(context)
                          .hintColor
                          .withOpacity(Get.isDarkMode ? 0.1 : 0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ]
                : null,
          ),
          child: Center(
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
