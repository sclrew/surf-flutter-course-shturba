import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/parts.dart';
import 'package:places/ui/res/strings.dart';
import 'package:places/ui/res/text_styles.dart';

class WishSightCard extends StatefulWidget {
  final VoidCallback onCloseTap;
  final WishSight sight;

  const WishSightCard({
    required this.onCloseTap,
    required this.sight,
    Key? key,
  }) : super(key: key);

  @override
  State<WishSightCard> createState() => _WishSightCardState();
}

class _WishSightCardState extends State<WishSightCard> {
  DateTime _data = DateTime.now();

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
                      widget.sight.url,
                      width: MediaQuery.of(context).size.width * 0.9,
                      alignment: Alignment.topLeft,
                      fit: BoxFit.fitWidth,
                      loadingBuilder: (
                        context,
                        child,
                        loadingProgress,
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
                            widget.sight.type.toString(),
                            style: roboto400x16xwhite,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 19, right: 18),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  final res = await wishDatePicker(context);
                                  if (res != null) {
                                    setState(() {
                                      _data = res;
                                      debugPrint(_data.toString());
                                    });
                                  }
                                },
                                child: calendarImg24,
                              ),
                              otstupW25,
                              GestureDetector(
                                onTap: widget.onCloseTap,
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.sight.name,
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
                            style: Theme.of(context).textTheme.headline6,
                            children: <TextSpan>[
                              TextSpan(
                                text: words['ScheduledFor'],
                              ),
                              TextSpan(
                                text: widget.sight.visitTime,
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
        // const SizedBox(
        //   height: 16,
        // ),
      ],
    );
  }

  Future<DateTime?> wishDatePicker(BuildContext context) {
    return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        lastDate: DateTime(2100),
        firstDate: DateTime.now().subtract(
          const Duration(days: 15),
        ),
        cancelText: words['cancel'],
        confirmText: words['confirm'],
        helpText: words['chooseDate'],
        builder: (context, child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: const Color(0xff252849),
              colorScheme: const ColorScheme.light(
                primary: Color(0xff252849),
              ),
            ),
            child: Container(
              child: child,
            ),
          );
        });
  }
}
