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
      backgroundColor: Colors.white,
      appBar: appBar,
      body: const Center(child: Text("Hello!")),
    );
  }

  AppBar appBar = AppBar(
    brightness: Brightness.light,
    backgroundColor: Colors.white,
    elevation: 0,
    toolbarHeight: 100,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 30,
              color: Color(0xff262847),
              fontWeight: FontWeight.w700,
            ),
            children: <TextSpan>[
              TextSpan(text: 'C', style: TextStyle(color: Color(0xff67ad5b))),
              TextSpan(text: 'писок\n'),
              TextSpan(text: 'и', style: TextStyle(color: Color(0xfff7de5e))),
              TextSpan(text: 'нтересных мест'),
            ],
          ),
        ),
      ],
    ),
  );
}
