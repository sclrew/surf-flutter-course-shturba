import 'package:flutter/material.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({Key? key}) : super(key: key);

  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Container(
          height:
              MediaQuery.of(context).size.height - // высота всего экрана минус
                  appBar.preferredSize.height // высота appBar и
                  -
                  MediaQuery.of(context).padding.top, // минус высота статусбар
          // ну и потенциально bottomNavBar тоже минусуем
          child: const Center(child: Text("Hello!"))),
    );
  }

  AppBar appBar = AppBar();
}
