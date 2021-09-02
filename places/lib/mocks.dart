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
  CheckedSight(
    '02.01.2020',
    'Берлинская стена',
    52.5065133,
    13.389687,
    'https://static.kulturologia.ru/files/u28343/283430541.jpg',
    'Берлинская стена разделяла западную и восточную части города, отделяя Западный Берлин от территории ГДР.',
    'История',
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
  WishSight(
    '02.01.2025',
    'Берлинская стена',
    52.5065133,
    13.389687,
    'https://static.kulturologia.ru/files/u28343/283430541.jpg',
    'Берлинская стена разделяла западную и восточную части города, отделяя Западный Берлин от территории ГДР.',
    'История',
  ),
];

final List<String> imagesUrl = [
  'https://static.mk.ru/upload/iblock_mk/550/20/41/d6/DETAIL_PICTURE__29245716.jpg',
  'http://ic.pics.livejournal.com/zina_korzina/4290981/814879/814879_original.jpg',
  'https://i.pinimg.com/originals/78/95/ef/7895efcdc4d7cfa5abea273c818167f9.jpg',
  'https://www.rubaltic.ru/upload/iblock/fe5/fe53ad3bd7bc18d4326f7b1cf47aef08.jpg',
  'https://magazin-soldatikov.ru/upload/iblock/394/3948a85d42875ffc1e85e811cef4f80c.jpg',
  'http://ugramegasport.ru/wp-content/uploads/2017/03/P3190072.jpg',
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
