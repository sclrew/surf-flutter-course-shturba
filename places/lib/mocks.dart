import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'dart:math';

final List<Sight> mocks = <Sight>[
  Sight(
    'Байкал',
    53.662492,
    104.5868627,
    'https://otailande.com/wp-content/uploads/2019/06/1-276.jpg',
    'озеро тектонического происхождения в южной части Восточной Сибири',
    'Природа',
  ),
  Sight(
    'Московский Кремль',
    55.7520263,
    37.6153107,
    'https://avatars.mds.yandex.net/get-zen_doc/1841592/pub_5c774aaf8cbda400c2d14ff3_5c7761603c18f100c3be026c/scale_1200',
    'Государственный историко-культурный музей-заповедник «Московский Кремль»',
    'История',
  ),
  Sight(
    'Эйфелева башня',
    48.8583736,
    2.2922926,
    'https://img4.goodfon.ru/wallpaper/nbig/c/87/parizh-frantsiia-rassvet-eifeleva-bashnia-panorama.jpg',
    'металлическая башня в центре Парижа',
    'Развлечение',
  ),
  Sight(
    'Берлинская стена',
    52.5065133,
    13.389687,
    'https://static.kulturologia.ru/files/u28343/283430541.jpg',
    'Берлинская стена разделяла западную и восточную части города, отделяя Западный Берлин от территории ГДР.',
    'История',
  ),
];

final List<CheckedSight> visitedSights = <CheckedSight>[
  CheckedSight(
    '01.01.2018',
    'Байкал',
    53.662492,
    104.5868627,
    'https://otailande.com/wp-content/uploads/2019/06/1-276.jpg',
    'озеро тектонического происхождения в южной части Восточной Сибири',
    'Природа',
  ),
  CheckedSight(
    '01.01.2019',
    'Московский Кремль',
    55.7520263,
    37.6153107,
    'https://avatars.mds.yandex.net/get-zen_doc/1841592/pub_5c774aaf8cbda400c2d14ff3_5c7761603c18f100c3be026c/scale_1200',
    'Государственный историко-культурный музей-заповедник «Московский Кремль»',
    'История',
  ),
  CheckedSight(
    '01.01.2020',
    'Эйфелева башня',
    48.8583736,
    2.2922926,
    'https://img4.goodfon.ru/wallpaper/nbig/c/87/parizh-frantsiia-rassvet-eifeleva-bashnia-panorama.jpg',
    'металлическая башня в центре Парижа',
    'Развлечение',
  ),
];

final List<WishSight> wishSights = <WishSight>[
  WishSight(
    '01.01.2022',
    'Байкал',
    53.662492,
    104.5868627,
    'https://otailande.com/wp-content/uploads/2019/06/1-276.jpg',
    'озеро тектонического происхождения в южной части Восточной Сибири',
    'Природа',
  ),
  WishSight(
    '01.01.2023',
    'Московский Кремль',
    55.7520263,
    37.6153107,
    'https://avatars.mds.yandex.net/get-zen_doc/1841592/pub_5c774aaf8cbda400c2d14ff3_5c7761603c18f100c3be026c/scale_1200',
    'Государственный историко-культурный музей-заповедник «Московский Кремль»',
    'История',
  ),
  WishSight(
    '01.01.2024',
    'Эйфелева башня',
    48.8583736,
    2.2922926,
    'https://img4.goodfon.ru/wallpaper/nbig/c/87/parizh-frantsiia-rassvet-eifeleva-bashnia-panorama.jpg',
    'металлическая башня в центре Парижа',
    'Развлечение',
  ),
];

// мои широта и долгота
// double myLatitude = 44.9318866;
// double myLongitude = 35.5726771;

//москва координаты
double myLatitude = 55.5815244;
double myLongitude = 36.8251261;
// 1 градус - 111 км или 111 000м

double minDistanceSetting = 10;
double maxDistanceSetting = 10000;

num myDistance(Sight mySight) {
  num distance = 0;
  final kvadratLong = pow(myLongitude - mySight.lon, 2);
  final kvadratLat = pow(myLatitude - mySight.lat, 2);
  distance = sqrt(kvadratLat + kvadratLong) * 111;
  return distance;
}

String inMyRange(List<Sight> mocks, RangeValues range) {
  int inRange = 0;

  mocks.forEach((element) {
    var distance = myDistance(element);
    if (range.start < distance && range.end > distance) inRange = inRange + 1;
  });

  return inRange.toString();
}
