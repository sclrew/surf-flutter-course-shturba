import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/sight_card.dart';

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
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SightCard(sight: mocks[0]),
                  SightCard(sight: mocks[1]),
                  SightCard(sight: mocks[2]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar appBar = AppBar(
    brightness: Brightness.light,
    backgroundColor: Colors.white,
    elevation: 0,
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(100),
      child: Row(
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
    ),
    // title: Row(
    //   mainAxisAlignment: MainAxisAlignment.start,
    //   children: [
    //     RichText(
    //       text: const TextSpan(
    //         style: TextStyle(
    //           fontSize: 30,
    //           color: Color(0xff262847),
    //           fontWeight: FontWeight.w700,
    //         ),
    //         children: <TextSpan>[
    //           TextSpan(text: 'C', style: TextStyle(color: Color(0xff67ad5b))),
    //           TextSpan(text: 'писок\n'),
    //           TextSpan(text: 'и', style: TextStyle(color: Color(0xfff7de5e))),
    //           TextSpan(text: 'нтересных мест'),
    //         ],
    //       ),
    //     ),
    //   ],
    // ),
  );
}
