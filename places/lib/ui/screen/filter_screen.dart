import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:places/domain/data_range.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/assets.dart';
import 'package:places/ui/res/parts.dart';
import 'package:places/ui/res/strings.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/screen/sight_list_screen.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  // RangeValues _selectedRange = MyRangeCalc().myRange.value;

  bool isHotel = false;
  bool isRestaurant = false;
  bool isSpecial = false;
  bool isPark = false;
  bool isMuseum = false;
  bool isCafe = false;

  var _selectedRange = const RangeValues(100, 10000);
  bool _isSmallScreen = false;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 481) _isSmallScreen = true;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        margin: const EdgeInsets.only(top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    otstupH12,
                    SizedBox(
                      height: 32,
                      width: 32,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Theme.of(context).primaryColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 16,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                      ),
                    ),
                    otstupH12,
                  ],
                ),
                TextButton(
                  onPressed: () {
                    setState(
                      () {
                        isHotel = false;
                        isRestaurant = false;
                        isSpecial = false;
                        isPark = false;
                        isMuseum = false;
                        isCafe = false;
                        _selectedRange = RangeValues(100, 10000);
                      },
                    );
                  },
                  child: Text(
                    words['clear']!,
                    // 'Очистить',
                    style: roboto500x16,
                  ),
                ),
              ],
            ),
            otstupH24,
            Text(
              words['categories']!.toUpperCase(),
              style: robotohead400x12,
            ),
            otstupH24,
            GridView.count(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              crossAxisCount: 3,
              children: [
                MenuElement(
                  isActive: isHotel,
                  imgUrl: assetsUrl['hotel']!,
                  nazvanie: words['Hotel']!,
                  onTap: () {
                    setState(() {
                      isHotel = !isHotel;
                    });
                  },
                ),
                MenuElement(
                  isActive: isRestaurant,
                  imgUrl: assetsUrl['restaurant']!,
                  nazvanie: words['Restaurant']!,
                  onTap: () {
                    setState(() {
                      isRestaurant = !isRestaurant;
                    });
                  },
                ),
                MenuElement(
                  isActive: isSpecial,
                  imgUrl: assetsUrl['special']!,
                  nazvanie: words['specialPlace']!,
                  onTap: () {
                    setState(() {
                      isSpecial = !isSpecial;
                    });
                  },
                ),
              ],
            ),
            if (_isSmallScreen)
              const SizedBox(
                height: 28,
              )
            else
              const SizedBox(
                height: 56,
              ),
            Container(
              padding: const EdgeInsets.only(top: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    words['Distance']!,
                    style: roboto16x400,
                  ),
                  Text(
                    '${words["from"]!} ${_selectedRange.start.toStringAsFixed(0)} ${words["to"]!} ${_selectedRange.end.toStringAsFixed(0)} ${words['km']!}',
                    style: roboto16x400,
                  ),
                ],
              ),
            ),
            if (_isSmallScreen)
              const SizedBox(
                height: 24,
              )
            else
              const SizedBox(
                height: 32,
              ),
            RangeSlider(
              min: 0,
              max: 10000,
              divisions: 100,
              values: _selectedRange,
              labels: RangeLabels(
                // '1', '3',
                _selectedRange.start.toStringAsFixed(2),
                _selectedRange.end.toStringAsFixed(2),
              ),
              onChanged: (newRange) {
                setState(() {
                  _selectedRange = newRange;
                });
              },
            ),
            if (_isSmallScreen)
              const SizedBox(
                height: 33,
              )
            else
              Expanded(
                child: Container(),
              ),
            Container(
              margin: _isSmallScreen
                  ? const EdgeInsets.symmetric(horizontal: 16)
                  : const EdgeInsets.only(left: 16, top: 24, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(328, 48),
                      backgroundColor: const Color(0xff4CAF50),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) => SightListScreen(
                            startR: _selectedRange.start,
                            endR: _selectedRange.end,
                          ),
                        ),
                        (route) => false,
                      );
                    },
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${words["showD"]!.toUpperCase()} (${inMyRange(mocks, _selectedRange)})',
                            style: roboto14x700xwhite,
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (_isSmallScreen)
                    Container()
                  else
                    const SizedBox(
                      height: 24,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
