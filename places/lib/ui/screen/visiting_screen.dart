import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/sight_card.dart';
// import 'package:places/ui/screen/sight_card_visited_empty.dart';
import 'package:places/ui/screen/sight_card_visited.dart';
import 'package:places/ui/screen/sight_card_visited_empty.dart';
import 'package:places/ui/screen/sight_card_wish.dart';
import 'package:places/ui/screen/sight_card_wish_empty.dart';
// import 'package:places/ui/screen/sight_card_wish_empty.dart';

class VisitingScreen extends StatefulWidget {
  const VisitingScreen({Key? key}) : super(key: key);

  @override
  _VisitingScreenState createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State<VisitingScreen> {
  final List<WishSight> _wishSights = wishSights;
  final List<CheckedSight> _visitedSights = visitedSights;

  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          // elevation: 0,
          toolbarHeight: 108,
          // backgroundColor: Colors.white,
          title: Text(
            'Избранное',
            style: GoogleFonts.roboto(
              color: Theme.of(context).canvasColor,
              fontWeight: FontWeight.w500,
              height: 1.33,
              fontSize: 18,
            ),
          ),
          bottom: PreferredSize(
            child: Container(
              margin: const EdgeInsets.only(
                top: 6.0,
                right: 15,
                bottom: 6,
                left: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Theme.of(context).primaryColorLight,
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Theme.of(context).primaryColorDark,
                ),
                // indicatorColor: Color(0xff3B3E5B),
                unselectedLabelColor: const Color(0xff7c7e92),
                unselectedLabelStyle: const TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  height: 1.33,
                  fontSize: 16,
                ),
                labelColor: Theme.of(context).focusColor,
                labelStyle: const TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  height: 1.33,
                  fontSize: 16,
                ),
                tabs: const [
                  Tab(text: 'Хочу посетить'),
                  Tab(text: 'Посетил'),
                ],
              ),
            ),
            preferredSize: const Size.fromHeight(52),
          ),
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 16),
          child: TabBarView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_wishSights.isNotEmpty)
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          for (var i = 0; _wishSights.length > i; i++)
                            WishSightCard(
                              onCloseTap: () {
                                setState(() {
                                  _wishSights.remove(_wishSights[i]);
                                });
                              },
                              sight: _wishSights[i],
                              key: ValueKey(
                                'wish_${_wishSights[i].lat}${_wishSights[i].lon}',
                              ),
                            ),
                        ],
                      ),
                    ),
                  if (_wishSights.isEmpty) const WishSightEmpty(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_visitedSights.isNotEmpty)
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          for (var i = 0; _visitedSights.length > i; i++)
                            VisitedSightCard(
                              onCloseTap: () {
                                setState(() {
                                  _visitedSights.remove(_visitedSights[i]);
                                });
                              },
                              sight: _visitedSights[i],
                              key: ValueKey(
                                'visited${_visitedSights[i].lat}${_visitedSights[i].lon}',
                              ),
                            ),
                        ],
                      ),
                    ),
                  if (_visitedSights.isEmpty) const VisitedSightEmpty(),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _bottomNavIndex,
          type: BottomNavigationBarType.fixed,
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
      ),
    );
  }
}
