import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:places/main.dart';
import 'package:places/ui/res/parts.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isChecked = false;

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
                    sText: 'Настройки',
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
                    sText: 'Светлая тема',
                    sTextStyle: roboto16x400,
                  ),
                if (isChecked == false)
                  SRichText(
                    sText: 'Тёмная тема',
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
                  sText: 'Смотреть туториал',
                  sTextStyle: roboto16x400,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/img/info.png',
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.article_outlined,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map_outlined,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
