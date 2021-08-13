import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/screen/sight_card_empty.dart';
import 'package:places/ui/screen/sight_card_visited.dart';

import '../../mocks.dart';

class VisitingScreen extends StatefulWidget {
  const VisitingScreen({Key? key}) : super(key: key);

  @override
  _VisitingScreenState createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State<VisitingScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 108,
          backgroundColor: Colors.white,
          title: const Text(
            'Избранное',
            style: TextStyle(
                color: Color(0xff252849),
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                height: 1.33,
                fontSize: 18),
          ),
          bottom: PreferredSize(
              child: Container(
                margin:
                    EdgeInsets.only(top: 6.0, right: 15, bottom: 6, left: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Color(0xffF5F5F5),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color(0xff3B3E5B),
                  ),
                  // indicatorColor: Color(0xff3B3E5B),
                  unselectedLabelColor: Color(0xff7C7E928F),
                  unselectedLabelStyle: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      height: 1.28,
                      fontSize: 14),
                  labelColor: Colors.white,
                  labelStyle: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      height: 1.33,
                      fontSize: 18),
                  tabs: [Tab(text: 'Хочу посетить'), Tab(text: 'Посетил')],
                ),
              ),
              preferredSize: Size.fromHeight(52)),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 16),
          child: TabBarView(
            children: [
              SightEmpty(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        VisitedSightCard(sight: visitedSights[0]),
                        SizedBox(
                          height: 16,
                        ),
                        VisitedSightCard(sight: visitedSights[1]),
                        SizedBox(
                          height: 16,
                        ),
                        VisitedSightCard(sight: visitedSights[2]),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
