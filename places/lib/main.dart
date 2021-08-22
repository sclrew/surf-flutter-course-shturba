import 'dart:async';

import 'package:flutter/material.dart';
import 'package:places/ui/res/themes.dart';
import 'package:places/ui/screen/filter_screen.dart';
import 'package:places/ui/screen/settings.dart';
import 'package:places/ui/screen/sight_details.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/visiting_screen.dart';

StreamController<bool> isLightTheme = StreamController();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        initialData: true,
        stream: isLightTheme.stream,
        builder: (context, snapshot) {
          return MaterialApp(
            // theme: sDarkTheme,
            // theme: sLightTheme,
            theme: snapshot.data! ? sLightTheme : sDarkTheme,
            debugShowCheckedModeBanner: false,
            // home: SightDetails(), // Детализация места
            // home: const VisitingScreen(), // посетил - хочу посетить
            // home: FilterScreen(),
            home: const Settings(),
          );
        });
  }
}
