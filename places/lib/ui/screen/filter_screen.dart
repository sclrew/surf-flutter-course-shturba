import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:places/ui/res/parts.dart';
import 'package:places/ui/res/text_styles.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isHotel = false;
  bool isRestaurant = false;
  bool isSpecial = false;
  bool isPark = false;
  bool isMuseum = false;
  bool isCafe = false;
  var _selectedRange = RangeValues(1000, 10000);

  @override
  Widget build(BuildContext context) {
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
                          // ignore: avoid_print
                          print('Назад');
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
                    setState(() {
                      isHotel = false;
                      isRestaurant = false;
                      isSpecial = false;
                      isPark = false;
                      isMuseum = false;
                      isCafe = false;
                      _selectedRange = RangeValues(1000, 10000);
                    });
                  },
                  child: Text(
                    'Очистить',
                    style: roboto500x16,
                  ),
                ),
              ],
            ),
            otstupH24,
            Text(
              'КАТЕГОРИИ',
              style: robotohead400x12,
            ),
            otstupH24,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MenuElement(
                  isActive: isHotel,
                  imgUrl: 'assets/img/hotel.png',
                  nazvanie: 'Отель',
                  onTap: () {
                    setState(() {
                      isHotel = !isHotel;
                    });
                  },
                ),
                MenuElement(
                  isActive: isRestaurant,
                  imgUrl: 'assets/img/restaurant.png',
                  nazvanie: 'Ресторан',
                  onTap: () {
                    setState(() {
                      isRestaurant = !isRestaurant;
                    });
                  },
                ),
                MenuElement(
                  isActive: isSpecial,
                  imgUrl: 'assets/img/special.png',
                  nazvanie: 'Особое место',
                  onTap: () {
                    setState(() {
                      isSpecial = !isSpecial;
                    });
                  },
                ),
              ],
            ),
            otstupH40,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MenuElement(
                  isActive: isPark,
                  imgUrl: 'assets/img/park.png',
                  nazvanie: 'Парк',
                  onTap: () {
                    setState(() {
                      isPark = !isPark;
                    });
                  },
                ),
                MenuElement(
                  isActive: isMuseum,
                  imgUrl: 'assets/img/museum.png',
                  nazvanie: 'Музей',
                  onTap: () {
                    setState(() {
                      isMuseum = !isMuseum;
                    });
                  },
                ),
                MenuElement(
                  isActive: isCafe,
                  imgUrl: 'assets/img/cafe.png',
                  nazvanie: 'Кафе',
                  onTap: () {
                    setState(() {
                      isCafe = !isCafe;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 56,
            ),
            Container(
              padding: const EdgeInsets.only(top: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Расстояние',
                    style: roboto16x400,
                  ),
                  Text(
                    'от 100 до 10000 км',
                    style: roboto16x400,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            RangeSlider(
              min: 100,
              max: 10000,
              divisions: 100,
              values: _selectedRange,
              labels: RangeLabels(
                _selectedRange.start.toString(),
                _selectedRange.end.toString(),
              ),
              onChanged: (newRange) {
                setState(() {
                  _selectedRange = newRange;
                });
              },
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16, top: 24, right: 16),
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
                      // ignore: avoid_print
                      print('Постройте маршрут');
                    },
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Показать (190)'.toUpperCase(),
                            style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              height: 1.3,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
