import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/controller/theme_controller.dart';
import 'package:hotel_booking/utils/icons.dart';
import 'package:hotel_booking/view/base/language_dialog.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          _customTile(context, FFIcons.notification, 'notifications'.tr, () {}),
          _customTile(context, FFIcons.question, 'promotions'.tr, () {}),
          _customTile(context, FFIcons.moon, 'dark_mode'.tr, () {
            ThemeController.to.toggleTheme();
          }, theme: true),
          _customTile(context, FFIcons.globe, 'language'.tr, () {
            showDialog(
                context: context,
                builder: ((context) {
                  return const LanguageDialog();
                }));
          })
        ],
      ),
    ));
  }

  _customTile(
      BuildContext context, IconData icon, String text, Function() onPressed,
      {bool theme = false}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 0,
      visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
      leading: Icon(
        icon,
        size: 28,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      trailing: theme
          ? GetBuilder<ThemeController>(builder: (themeController) {
              return CupertinoSwitch(
                value: themeController.darkTheme,
                onChanged: (value) {
                  themeController.toggleTheme();
                },
              );
            })
          : null,
      onTap: onPressed,
    );
  }
}
