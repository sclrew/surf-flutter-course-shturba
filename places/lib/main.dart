// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
// import 'package:places/test.dart';
import 'package:places/ui/res/themes.dart';
import 'package:places/ui/screen/add_sight_screen.dart';
import 'package:places/ui/screen/filter_screen.dart';
import 'package:places/ui/screen/onboardingScreen.dart';
import 'package:places/ui/screen/settings.dart';
import 'package:places/ui/screen/sight_details.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/sight_search_screen.dart';
import 'package:places/ui/screen/splash_screen.dart';
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
      routes: {
        'Settings': (context) => const Settings(),
        'FilterScreen': (context) => const FilterScreen(),
        'VisitingScreen': (context) => const VisitingScreen(),
        'AddSightScreen': (context) => const AddSightScreen(),
        'SightSearchScreen': (context) => const SightSearchScreen(),
        'SightListScreen': (context) => SightListScreen(),
      },
      theme:
          Provider.of<SThemes>(context).isLightTheme ? sLightTheme : sDarkTheme,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        isInitialized: _initializing(),
      ),
    );
  }
}

Future<String> _initializing() async {
  await Future.delayed(
    const Duration(seconds: 2),
    () => {
      debugPrint('2 секунды прошло - пора переходить '),
      debugPrint('Переход на следующий экран'),
    },
  );
  return 'gotovo';
}

class SThemes extends ChangeNotifier {
  bool isLightTheme = true;

  void changeTheme(bool isNewBool) {
    isLightTheme = isNewBool;
    notifyListeners();
  }
}
