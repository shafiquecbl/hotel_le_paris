import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/common/button.dart';
import 'package:hotel_booking/common/language_dialog.dart';
import 'package:hotel_booking/controller/theme_controller.dart';
import 'package:hotel_booking/utils/icons.dart';
import 'package:hotel_booking/utils/network_image.dart';
import 'package:hotel_booking/utils/style.dart';
import '../../base/progress_card.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          const SizedBox(height: 20),
          // user image
          Row(
            children: [
              const CircleAvatar(
                radius: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  child: CustomNetworkImage(
                      loadingRadius: 50,
                      url:
                          'https://media.licdn.com/dms/image/D4D03AQEn19TZB9AK1w/profile-displayphoto-shrink_400_400/0/1664789524738?e=1682553600&v=beta&t=AfJ6iVi9ah3aH4KuqwNjl-_NRckzaLkCuDAPfm-KNps'),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('John Doe',
                        style: TextStyle(
                            fontSize: fontSizeLarge(context),
                            fontWeight: FontWeight.bold)),
                    Text('Traveler',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: fontWeightNormal)),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        RoundButton(
                            height: 35.0,
                            radius: 8.0,
                            padding: 5,
                            text: 'Edit Profile',
                            iconData: FFIcons.edit,
                            onPressed: () {}),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 40),
          const ProgressCard(),
          const SizedBox(height: 30),

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
