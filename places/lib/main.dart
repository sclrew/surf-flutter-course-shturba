import 'package:flutter/material.dart';
import 'package:places/ui/res/themes.dart';
import 'package:places/ui/screen/filter_screen.dart';
import 'package:places/ui/screen/sight_details.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/visiting_screen.dart';

// import 'ui/screen/sight_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: sDarkTheme,
      theme: sLightTheme,
      debugShowCheckedModeBanner: false,
      // home: SightDetails(), // Детализация места
      // home: const SightListScreen(), //Список интересных мест
      // home: const VisitingScreen(), // посетил - хочу посетить
      home: FilterScreen(),
    );
  }
}
