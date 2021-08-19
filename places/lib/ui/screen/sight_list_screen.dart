import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/sight_card.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({Key? key}) : super(key: key);

  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: sAppBar(context),
      body: Row(
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

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        elevation: 10,
        iconSize: 26,
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

  AppBar sAppBar(BuildContext context) {
    return AppBar(
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 16,
            ),
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.headline3,
                children: <TextSpan>[
                  TextSpan(
                    text: 'C',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const TextSpan(text: 'писок\n'),
                  TextSpan(
                    text: 'и',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const TextSpan(text: 'нтересных мест'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
