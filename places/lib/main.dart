// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:places/ui/res/themes.dart';
import 'package:places/ui/screen/filter_screen.dart';
import 'package:places/ui/screen/settings.dart';
import 'package:places/ui/screen/sight_details.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/visiting_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => SThemes(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: sDarkTheme,
      // theme: sLightTheme,
      theme:
          Provider.of<SThemes>(context).isLightTheme ? sLightTheme : sDarkTheme,
      // theme: snapshot.data! ? sLightTheme : sDarkTheme,
      debugShowCheckedModeBanner: false,
      // home: SightDetails(), // Детализация места
      // home: const VisitingScreen(), // посетил - хочу посетить
      // home: FilterScreen(),
      home: const Settings(),
    );
  }
  // );
}
// }

class SThemes extends ChangeNotifier {
  bool isLightTheme = true;

  void changeTheme(bool isNewBool) {
    isLightTheme = isNewBool;
    notifyListeners();
  }
}
