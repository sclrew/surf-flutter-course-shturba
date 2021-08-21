import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/parts.dart';

class SightDetails extends StatefulWidget {
  const SightDetails({Key? key}) : super(key: key);

  @override
  _SightDetailsState createState() => _SightDetailsState();
}

class _SightDetailsState extends State<SightDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xffffffff),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 360,
            child: Stack(
              children: [
                Image.network(
                  mocks[2].url,
                  fit: BoxFit.fill,
                  height: 360,
                  loadingBuilder: (
                    BuildContext context,
                    Widget child,
                    ImageChunkEvent? loadingProgress,
                  ) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 36, left: 16),
                  child: SizedBox(
                    height: 32,
                    width: 32,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
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
                      // child: Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Container(
                      //       constraints:
                      //           const BoxConstraints(maxHeight: 32, maxWidth: 32),
                      //       decoration: BoxDecoration(
                      //         color: Theme.of(context).primaryColor,
                      //         borderRadius: const BorderRadius.all(
                      //           Radius.circular(10),
                      //         ),
                      //       ),
                      //       child: Center(
                      //         child: IconButton(
                      //           onPressed: () {},
                      //           icon: Icon(
                      //             Icons.arrow_back_ios_new_rounded,
                      //             size: 16,
                      //             color: Theme.of(context).secondaryHeaderColor,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16, top: 24, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                    width: MediaQuery.of(context).size.width * 0.7,
                    // height: MediaQuery.of(context).size.height * 0.5,
                  ),
                  child: Text(
                    'Пряности и радости',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'ресторан',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      'закрыто до 09:00',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: const Color(0xff7C7E92).withOpacity(0.56),
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Пряный вкус радостной жизни вместе с шеф-поваром Изо Дзандзава, благодаря которой у гостей ресторана есть возможность выбирать из двух направлений: европейского и восточного',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(
                  height: 24,
                ),
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
                        unionImg,
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Постройте маршрут'.toUpperCase(),
                          style: const TextStyle(
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
                Container(
                  height: 0.8,
                  color: const Color(0xFF7C7E92).withOpacity(0.24),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 40,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                          child: Center(
                            child: GestureDetector(
                              onTap: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.calendar_today,
                                    color: const Color(0xff7C7E92)
                                        .withOpacity(0.56),
                                    size: 20,
                                  ),
                                  const SizedBox(
                                    width: 9,
                                  ),
                                  Text(
                                    'Запланировать',
                                    style: TextStyle(
                                      fontSize: 14,
                                      height: 1.3,
                                      color: const Color(0xff7C7E92)
                                          .withOpacity(0.56),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          child: Center(
                            child: GestureDetector(
                              onTap: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    color: Theme.of(context).primaryColorDark,
                                    size: 20,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'В Избранное',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      height: 1.3,
                                      color: Theme.of(context).primaryColorDark,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
