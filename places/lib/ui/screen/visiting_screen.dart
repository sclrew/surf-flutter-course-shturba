import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/parser.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/parts.dart';
import 'package:places/ui/res/strings.dart';
import 'package:places/ui/screen/sight_card.dart';
// import 'package:places/ui/screen/sight_card_visited_empty.dart';
import 'package:places/ui/screen/sight_card_visited.dart';
import 'package:places/ui/screen/sight_card_visited_empty.dart';
import 'package:places/ui/screen/sight_card_wish.dart';
import 'package:places/ui/screen/sight_card_wish_empty.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
// import 'package:places/ui/screen/sight_card_wish_empty.dart';

class VisitingScreen extends StatefulWidget {
  const VisitingScreen({Key? key}) : super(key: key);

  @override
  _VisitingScreenState createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State<VisitingScreen> {
  final List<WishSight> _wishSights = wishSights;
  final List<VisitedSight> _visitedSights = visitedSights;

  int _bottomNavIndex = 2;
  bool _isAbove = false;

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
            words['Favorites']!,
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
                tabs: [
                  Tab(text: words['WantToVisit']),
                  Tab(text: words['Visited']),
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
              if (_wishSights.isEmpty)
                const WishSightEmpty()
              else
                ListView.builder(
                  physics: Platform.isAndroid
                      ? const ClampingScrollPhysics() // Android физика скрола
                      : const BouncingScrollPhysics(), // IOS физика скрола
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  itemCount: _wishSights.length,
                  itemBuilder: (context, i) {
                    return Column(
                      children: [
                        DragTarget<WishSight>(
                          builder: (context, candidateDate, rejectDate) =>
                              AnimatedSwitcher(
                            child: _isAbove
                                ? const FillDragContainer()
                                : const EmptyDragContainer(),
                            duration: const Duration(seconds: 1),
                          ),
                          onMove: _onMoveWish,
                          onLeave: (data) => _onLeaveWish(data!),
                          onWillAccept: (data) => _onWillAcceptWish(data!, i),
                          onAccept: (data) => _onAcceptWish(data, i),
                        ),
                        Draggable<WishSight>(
                          axis: Axis.vertical,
                          data: _wishSights[i],
                          maxSimultaneousDrags: 1,
                          // начальное отображение
                          child: Dismissible(
                            key: UniqueKey(),
                            direction: DismissDirection.endToStart,
                            onDismissed: (details) {
                              setState(() {
                                _wishSights.remove(_wishSights[i]);
                              });
                            },
                            background: const RedTrashContainer(),
                            child: WishSightCard(
                              onCloseTap: () {
                                setState(() {
                                  _wishSights.remove(_wishSights[i]);
                                });
                              },
                              sight: _wishSights[i],
                              key: ValueKey(
                                'wish${_wishSights[i].lat}${_wishSights[i].lon}',
                              ),
                            ),
                          ),

                          // пока перетаскиваю
                          feedback: Opacity(
                            opacity: 0.7,
                            child: WishSightCard(
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
                          ),
                          childWhenDragging: Opacity(
                            opacity: 0.3,
                            child: WishSightCard(
                              onCloseTap: () {},
                              sight: _wishSights[i],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              if (_visitedSights.isEmpty)
                const VisitedSightEmpty()
              else
                ListView.builder(
                  // physics: Platform.isAndroid
                  //     ? const ClampingScrollPhysics() // Android физика скрола
                  //     : const BouncingScrollPhysics(), // IOS физика скрола
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  itemCount: _visitedSights.length,
                  itemBuilder: (context, i) {
                    return Column(
                      children: [
                        DragTarget<VisitedSight>(
                          builder: (context, candidateDate, rejectDate) =>
                              AnimatedSwitcher(
                            child: _isAbove
                                ? const FillDragContainer()
                                : const EmptyDragContainer(),
                            duration: const Duration(seconds: 1),
                          ),
                          onMove: _onMoveVisited,
                          onLeave: (data) => _onLeaveVisited(data!),
                          onWillAccept: (data) =>
                              _onWillAcceptVisited(data!, i),
                          onAccept: (data) => _onAcceptVisited(data, i),
                        ),
                        Draggable<VisitedSight>(
                          axis: Axis.vertical,
                          data: _visitedSights[i],
                          maxSimultaneousDrags: 1,
                          // начальное отображение
                          child: Dismissible(
                            key: UniqueKey(),
                            direction: DismissDirection.endToStart,
                            onDismissed: (details) {
                              setState(() {
                                _visitedSights.remove(_visitedSights[i]);
                              });
                            },
                            background: const RedTrashContainer(),
                            child: VisitedSightCard(
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
                          ),
                          // пока перетаскиваю
                          feedback: Opacity(
                            opacity: 0.7,
                            child: VisitedSightCard(
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
                          ),
                          childWhenDragging: Opacity(
                            opacity: 0.3,
                            child: VisitedSightCard(
                              onCloseTap: () {},
                              sight: _visitedSights[i],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
            ],
          ),
        ),
        bottomNavigationBar: SBottomNavBar(
          currentIndex: _bottomNavIndex,
          onTap: (index) {
            setState(() {
              if (index == 0) {
                Navigator.of(context).pushAndRemoveUntil<void>(
                  MaterialPageRoute<void>(
                    builder: (context) => const SightListScreen(),
                  ),
                  (route) => false,
                );
              } else {
                _bottomNavIndex = index;
              }
            });
          },
        ),
      ),
    );
  }

  bool _onWillAcceptWish(WishSight data, int i) {
    if (data == _wishSights[i]) {
      return false;
    }
    return true;
  }

  void _onMoveWish(DragTargetDetails<WishSight> data) {
    if (_isAbove == false) {
      setState(() {
        _isAbove = true;
      });
    }
  }

  void _onLeaveWish(WishSight data) {
    if (_isAbove) {
      setState(() {
        _isAbove = false;
      });
    }
  }

  void _onAcceptWish(WishSight data, int i) {
    _wishSights.remove(data);
    setState(() {
      _wishSights.insert(i, data);
      _isAbove = false;
    });
  }

  void _onMoveVisited(DragTargetDetails<VisitedSight> data) {
    if (_isAbove == false) {
      setState(() {
        _isAbove = true;
      });
    }
  }

  void _onLeaveVisited(VisitedSight data) {
    if (_isAbove) {
      setState(() {
        _isAbove = false;
      });
    }
  }

  void _onAcceptVisited(VisitedSight data, int i) {
    _visitedSights.remove(data);
    setState(() {
      _visitedSights.insert(i, data);
      _isAbove = false;
    });
  }

  bool _onWillAcceptVisited(VisitedSight data, int i) {
    if (data == _visitedSights[i]) {
      return false;
    }
    return true;
  }
}

class FillDragContainer extends StatelessWidget {
  const FillDragContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 16,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Icon(Icons.arrow_forward, size: 16, color: Colors.white),
          Icon(Icons.save_alt, size: 16, color: Colors.white),
          Icon(Icons.arrow_back, size: 16, color: Colors.white),
        ],
      ),
    );
  }
}

class EmptyDragContainer extends StatelessWidget {
  const EmptyDragContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      color: Colors.transparent,
      height: 16,
    );
  }
}
