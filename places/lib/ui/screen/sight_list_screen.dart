import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/parts.dart';
import 'package:places/ui/res/text_styles.dart';
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
      appBar: sAppBar(context),
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    otstupH30,
                    SightCard(sight: mocks[0]),
                    otstupH30,
                    SightCard(sight: mocks[1]),
                    otstupH30,
                    SightCard(sight: mocks[2]),
                  ],
                ),
              ),
            ],
          ),
          AddBtn(
            onTap: () {
              // ignore: avoid_print
              print('КЛИКНУЛ');
            },
            title: 'НОВОЕ МЕСТО',
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

class AddBtn extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const AddBtn({
    required this.onTap,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 15,
                  bottom: 15,
                  left: 26,
                  right: 22,
                ),
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(24.0),
                  gradient: const LinearGradient(colors: [
                    Color(0xffFCDD3D),
                    Color(0xff4CAF50),
                  ]),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Text(
                      title,
                      style: roboto14x700xwhite,
                    ),
                  ],
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(24),
                  splashColor: Colors.green.withOpacity(0.7),
                  onTap: onTap,
                  child: Container(
                    width: 178,
                    height: 49,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
