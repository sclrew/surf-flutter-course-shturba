import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:places/main.dart';
import 'package:places/ui/res/assets.dart';
import 'package:places/ui/res/parts.dart';
import 'package:places/ui/res/strings.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/visiting_screen.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isChecked = true;

  int _bottomNavIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        margin: const EdgeInsets.only(top: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: SRichText(
                    sText: words['Settings']!,
                    sTextStyle: roboto500x18,
                  ),
                ),
              ],
            ),
            otstupH36,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (isChecked)
                  SRichText(
                    sText: words['lightThemes']!,
                    sTextStyle: roboto16x400,
                  ),
                if (isChecked == false)
                  SRichText(
                    sText: words['darkThemes']!,
                    sTextStyle: roboto16x400,
                  ),
                Switch.adaptive(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = !isChecked;
                      Provider.of<SThemes>(context, listen: false)
                          .changeTheme(isChecked);
                    });
                  },
                ),
              ],
            ),
            hr08,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SRichText(
                  sText: words['watchTutorial']!,
                  sTextStyle: roboto16x400,
                ),
                Row(
                  children: [
                    Image.asset(
                      assetsUrl['info']!,
                      // 'assets/img/info.png',
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ],
            ),
            otstupH12,
            hr08,
          ],
        ),
      ),
      bottomNavigationBar: SBottomNavBar(
        onTap: (index) {
          if (index == 2) {
            Navigator.of(context).push<void>(
              MaterialPageRoute<void>(
                builder: (context) => const VisitingScreen(),
              ),
            );
          } else if (index == 0) {
            Navigator.of(context).push<void>(
              MaterialPageRoute<void>(
                builder: (context) => const SightListScreen(),
              ),
            );
          } else {
            setState(() {
              _bottomNavIndex = index;
            });
          }
        },
        currentIndex: _bottomNavIndex,
      ),
    );
  }
}
