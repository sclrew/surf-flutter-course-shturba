import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'dart:math';

final List<Sight> mocks = <Sight>[
  Sight(
    'Байкал',
    53.662492,
    104.5868627,
    'https://otailande.com/wp-content/uploads/2019/06/1-276.jpg',
    'Байкал находится в центре Азии, в России, на границе Иркутской области и Республики Бурятия. Озеро протянулось с севера на юго-запад на 636 км в виде гигантского полумесяца. Ширина Байкала колеблется от 25 до 80 км. Площадь водной поверхности составляет 31 722 км² (без учёта островов), что примерно равно площади таких стран, как Бельгия, Нидерланды или Дания. По площади водного зеркала Байкал занимает шестое место среди крупнейших озёр мира. Длина береговой линии — 2 100 км. Озеро находится в своеобразной котловине, со всех сторон окружённой горными хребтами и сопками. При этом западное побережье — скалистое и обрывистое, рельеф восточного побережья — более пологий (местами горы отступают от берега на десятки километров). Максимальная глубина озера — 1 637 метра была открыта в 1983 году Л. Г. Колотило, и А. И. Сулимовым во время выполнения гидрографических работ экспедицией ГУНиО МО СССР. Максимальная глубина была нанесена на карты в 1992 году, и подтверждена в 2002 году в результате выполнения совместного бельгийско-испанско-российского проекта по созданию новой батиметрической карты Байкала, когда были оцифрованы глубины в 1 312 788 точках акватории озера (значения глубин были получены в результате перевычисления данных акустического зондирования, совмещённых с дополнительной батиметрической информацией, в т.ч. эхолокации и сейсмического профилирования, один из авторов открытия максимальной глубины — Л.Г.Колотило, был участником этого проекта). Если учесть, что водная гладь озера находится на высоте 455,5 м над уровнем моря, то нижняя точка котловины лежит на 1 186,5 м ниже уровня мирового океана, что делает чашу Байкала также самой глубокой материковой впадиной. Средняя глубина озера также очень велика — 744,4 метров. Она превышает максимальные глубины многих очень глубоких озёр. ',
    'Природа',
    [
      'https://img.gazeta.ru/files3/345/6693345/Ice-on-Lake-Baikal-pic700-700x467-66269.jpg',
      'https://cdn.iz.ru/sites/default/files/styles/1920x1080/public/article-2019-02/RIAN_5626737.HR_.ru_.jpg?itok=wSFQZEYH',
      'https://icdn.lenta.ru/images/2016/07/22/17/20160722172539290/detail_41036bc3035e351972d96a9b7af310e3.jpg',
    ],
  ),
  Sight(
    'Московский Кремль',
    55.7520263,
    37.6153107,
    'https://avatars.mds.yandex.net/get-zen_doc/1841592/pub_5c774aaf8cbda400c2d14ff3_5c7761603c18f100c3be026c/scale_1200',
    'Первая крепость на Боровицком холме была построена во второй половине 13го века и просуществовала около двухсот лет. В 14-м веке были заложены белокаменные соборы, новые хоромы для княжеской семьи, двор митрополита, боярские дворы. При Дмитрии Донском были построены белокаменные стены и башни, но спустя сто лет, в 1485-1495 гг были выстроены новые, кирпичные стены и башни Кремля. Архитекторами выступили итальянские зодчие М. и П. Фрязины и П. Солари. Позднее Кремль достраивался и перестраивался. Перенос столицы в Петербург сказался на качестве содержания Кремля: строения ветшали, горели, стены разрушались. Кремль сильно пострадал во время Отечественной войны 1812 года, когда Москву захватили наполеоновские войска. Во время вооружённого восстания в октябре — ноябре 1917 года Кремль, на территории которого находились отряды юнкеров, серьёзно пострадал от артиллерийского обстрела, произведённого революционными войсками. За годы советской власти архитектурный ансамбль Московского Кремля также значительно пострадал. В 1929–1930 годах были полностью снесены два древних кремлёвских монастыря. В 1937 году на пяти башнях Кремля были установлены рубиновые звезды. С 1955 года Кремль частично открыт для посещения, став музеем под открытым небом. В 1990 году Кремль был включён в список всемирного наследия ЮНЕСКО. Главный вход в Кремль — Спасские ворота — находится с восточной стороны, обращенной к Красной площади, напротив храма Василия Блаженного. Спасская башня была построена в XV в. В 1625 было сооружено ее шатровое завершение, на котором установлены часы. Современные часы действуют с 1851 года. На юго-западной стороне Кремля, у реки, расположены Боровицкие ворота, через которые в 1812 году Наполеон вошел в Кремль. С запада, со стороны Александровского сада, в Кремль ведут Троицкие ворота, в одноименной башне раньше хранились ценные императорские архивы. В северной части Кремля расположены Никольские ворота, выходящие к северной оконечности Красной площади. Они используются для прохода в государственные учреждения.',
    'История',
    [
      'https://fregataero.ru/images/multithumb_thumbs/c_840_500_16777215_00_images_russia_moscow_kreml_moscow_kreml_3.jpg',
      'https://putidorogi-nn.ru/images/stories/evropa/rossiya/moskovskiy_kreml_8.jpg',
      'http://cdn.iz.ru/sites/default/files/styles/900x506/public/news-2017-09/KAZ_4314.JPG.jpg?itok=WXtj_xZx',
    ],
  ),
  Sight(
    'Эйфелева башня',
    48.8583736,
    2.2922926,
    'https://img4.goodfon.ru/wallpaper/nbig/c/87/parizh-frantsiia-rassvet-eifeleva-bashnia-panorama.jpg',
    'металлическая башня в центре Парижа',
    'Развлечение',
    [
      'https://mytravelry.com/ru/wp-content/uploads/sites/2/2019/01/Eifel-COVER.jpg',
      'https://slon.fr/wp-content/uploads/2020/07/393721-svetik-1280x960.jpg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu7S1fE4zmCqiUb4qFERVnw518zJFkoQ7IRG3Gvdbcy_eAXA-8uTRbjepgeRrioxSB4-s&usqp=CAU',
    ],
  ),
  Sight(
    'Берлинская стена',
    52.5065133,
    13.389687,
    'https://static.kulturologia.ru/files/u28343/283430541.jpg',
    'Берлинская стена разделяла западную и восточную части города, отделяя Западный Берлин от территории ГДР.',
    'История',
    [
      'https://cdn21.img.ria.ru/images/realty/40459/82/404598253_0:58:3098:1801_600x0_80_0_0_c84b2acc6637a42c1bccc56668979067.jpg',
      'https://cdn24.img.ria.ru/images/152728/44/1527284460_0:1:6000:3376_600x0_80_0_0_d80ea9d903a644cf07773d7abae995b9.jpg',
      'https://histrf.ru/uploads/media/default/0001/69/5bc489d429438583e0af600a61a93cf0013beba9.jpeg',
    ],
  ),
];

final List<VisitedSight> visitedSights = <VisitedSight>[
  VisitedSight(
    '01.01.2018',
    'Байкал',
    53.662492,
    104.5868627,
    'https://otailande.com/wp-content/uploads/2019/06/1-276.jpg',
    'озеро тектонического происхождения в южной части Восточной Сибири',
    'Природа',
    [],
  ),
  VisitedSight(
    '01.01.2019',
    'Московский Кремль',
    55.7520263,
    37.6153107,
    'https://avatars.mds.yandex.net/get-zen_doc/1841592/pub_5c774aaf8cbda400c2d14ff3_5c7761603c18f100c3be026c/scale_1200',
    'Государственный историко-культурный музей-заповедник «Московский Кремль»',
    'История',
    [],
  ),
  VisitedSight(
    '01.01.2020',
    'Эйфелева башня',
    48.8583736,
    2.2922926,
    'https://img4.goodfon.ru/wallpaper/nbig/c/87/parizh-frantsiia-rassvet-eifeleva-bashnia-panorama.jpg',
    'металлическая башня в центре Парижа',
    'Развлечение',
    [],
  ),
  VisitedSight(
    '02.01.2020',
    'Берлинская стена',
    52.5065133,
    13.389687,
    'https://static.kulturologia.ru/files/u28343/283430541.jpg',
    'Берлинская стена разделяла западную и восточную части города, отделяя Западный Берлин от территории ГДР.',
    'История',
    [],
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
    [],
  ),
  WishSight(
    '01.01.2023',
    'Московский Кремль',
    55.7520263,
    37.6153107,
    'https://avatars.mds.yandex.net/get-zen_doc/1841592/pub_5c774aaf8cbda400c2d14ff3_5c7761603c18f100c3be026c/scale_1200',
    'Государственный историко-культурный музей-заповедник «Московский Кремль»',
    'История',
    [],
  ),
  WishSight(
    '01.01.2024',
    'Эйфелева башня',
    48.8583736,
    2.2922926,
    'https://img4.goodfon.ru/wallpaper/nbig/c/87/parizh-frantsiia-rassvet-eifeleva-bashnia-panorama.jpg',
    'металлическая башня в центре Парижа',
    'Развлечение',
    [],
  ),
  WishSight(
    '02.01.2025',
    'Берлинская стена',
    52.5065133,
    13.389687,
    'https://static.kulturologia.ru/files/u28343/283430541.jpg',
    'Берлинская стена разделяла западную и восточную части города, отделяя Западный Берлин от территории ГДР.',
    'История',
    [],
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
