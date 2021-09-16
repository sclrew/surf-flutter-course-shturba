import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/assets.dart';
import 'package:places/ui/res/parts.dart';
import 'package:places/ui/res/strings.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/screen/add_sight_screen.dart';
import 'package:places/ui/screen/filter_screen.dart';
import 'package:places/ui/screen/settings.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/screen/sight_search_screen.dart';
import 'package:places/ui/screen/visiting_screen.dart';

class SightListScreen extends StatefulWidget {
  final double startR;
  final double endR;

  const SightListScreen({
    this.startR = 10,
    this.endR = 10000,
    Key? key,
  }) : super(key: key);

  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  late ScrollController _scrollController;
  int _bottomNavIndex = 0;
  bool _isScrolled = false;

  bool get _isSilverAppBarScrolled {
    return _scrollController.hasClients && _scrollController.offset > 80;
  }

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _isScrolled = _isSilverAppBarScrolled;
        });
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              pinned: true,
              title: Column(
                children: [
                  if (_isScrolled)
                    Text(
                      'Список интересных мест',
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        height: 1.33,
                        color: Theme.of(context).canvasColor,
                      ),
                    )
                  else
                    Container(),
                ],
              ),
              collapsedHeight: 72,
              expandedHeight: 140,
              flexibleSpace: const FlexibleSpaceBar(
                background: Title(),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  for (int i = 0; i < mocks.length; i++)
                    OneItem(
                      startR: widget.startR,
                      endR: widget.endR,
                      mocks: mocks,
                      nomer: i,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),

      // ListView.builder(
      //   keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      //   itemCount: mocks.length,
      //   itemBuilder: (context, index) {
      //     return OneItem(
      //       startR: widget.startR,
      //       endR: widget.endR,
      //       mocks: mocks,
      //       nomer: index,
      //     );
      //   },
      // ),
      floatingActionButton: AddBtn(
        onTap: () {
          Navigator.of(context).push<void>(
            MaterialPageRoute<void>(
              builder: (context) => const AddSightScreen(),
            ),
          );
        },
        title: words['NewPlace']!.toUpperCase(),
      ),
      bottomNavigationBar: SBottomNavBar(
        currentIndex: _bottomNavIndex,
        onTap: (index) {
          if (index == 2) {
            Navigator.of(context).push<void>(
              MaterialPageRoute<void>(
                builder: (context) => const VisitingScreen(),
              ),
            );
          } else if (index == 3) {
            Navigator.of(context).push<void>(
              MaterialPageRoute<void>(
                builder: (context) => const Settings(),
              ),
            );
          } else {
            setState(() {
              _bottomNavIndex = index;
            });
          }
        },
      ),
    );
  }
}

class OneItem extends StatelessWidget {
  final double startR;
  final double endR;
  final List<Sight> mocks;
  final int nomer;
  const OneItem({
    required this.startR,
    required this.endR,
    required this.mocks,
    required this.nomer,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final distance = myDistance(mocks[nomer]);
    // final showDistance = distance.toStringAsFixed(2);
    if (startR < distance && endR > distance) {
      return Column(
        children: [
          SightCard(sight: mocks[nomer]),
          // Text('$showDistance км'),
          if (mocks.length - 1 != nomer) otstupH30,
        ],
      );
    } else {
      return Container();
    }
  }
}

class Title extends StatelessWidget {
  const Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            otstupW16,
            const MainTitle(),
          ],
        ),
        otstupH18,
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: SizedBox(
            height: 40,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Stack(
              children: [
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (states) => const Color(0xffF5F5F5),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push<Object>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SightSearchScreen(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 16,
                          ),
                          SvgPicture.asset(
                            assetsUrl['searchSSvg']!,
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Поиск',
                            style: roboto400x16x7c7e92x056,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 15,
                  bottom: 13,
                  child: InkWell(
                    onTap: () {
                      Navigator.push<Object>(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FilterScreen(),
                        ),
                      );
                    },
                    child: Image.asset(
                      assetsUrl['searchS']!,
                      width: 18,
                      height: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
      ],
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
                  child: const SizedBox(
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
