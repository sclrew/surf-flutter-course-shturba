import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/parts.dart';
import 'package:places/ui/res/text_styles.dart';

class VisitedSightCard extends StatelessWidget {
  final VoidCallback onCloseTap;

  final VisitedSight sight;
  const VisitedSightCard({
    required this.onCloseTap,
    required this.sight,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            color: Colors.amber,
          ),
          child: AspectRatio(
            aspectRatio: 3 / 2,
            child: Column(
              children: [
                Expanded(
                  child: Stack(children: [
                    Image.network(
                      sight.url,
                      width: MediaQuery.of(context).size.width * 0.9,
                      alignment: Alignment.topLeft,
                      fit: BoxFit.fitWidth,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 16, left: 16),
                          child: Text(
                            sight.type.toString(),
                            style: roboto400x16xwhite,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 19, right: 18),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // ignore: avoid_print
                                  print('Поделиться нажато');
                                },
                                child: shareImg24,
                              ),
                              otstupW25,
                              GestureDetector(
                                onTap: onCloseTap,
                                child: closeIcon22,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]),
                  // ),
                ),
                Container(
                  height: 92,
                  width: MediaQuery.of(context).size.width * 0.90,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(left: 16, top: 16, right: 16),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          sight.name,
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              height: 1.25,
                            ),
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Theme.of(context).primaryColorDark,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xff7C7E92),
                            ),
                            children: <TextSpan>[
                              const TextSpan(
                                text: 'Цель достигнута ',
                              ),
                              TextSpan(
                                text: sight.visitTime,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
