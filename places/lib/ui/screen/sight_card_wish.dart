import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/my_material_picker.dart';
import 'package:places/ui/res/parts.dart';
import 'package:places/ui/res/strings.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/res/themes.dart';

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
  late TimeOfDay _data;

  @override
  void initState() {
    _data = TimeOfDay.now();
    super.initState();
  }

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
                                onTap: () {
                                  Platform.isAndroid
                                      ? _wishTimePickerAndroid()
                                      // : _wishTimePickerIOS(context);
                                      : _wishTimePickerIOS(context);
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
                                text: '${_data.hour}:${_data.minute}',
                                // text: widget.sight.visitTime,
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


  Future<void> _wishTimePickerIOS(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      builder: (_) {
        return Container(
          height: 180,
          padding: const EdgeInsets.symmetric(
            vertical: 30,
          ),
          color: Colors.white,
          child: Center(
            child: CupertinoDatePicker(
              initialDateTime: DateTime.now(),
              onDateTimeChanged: (val) {
                setState(
                  () {
                    _data = TimeOfDay.fromDateTime(val);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  Future _wishTimePickerAndroid() async {
    // final res = await showTimePicker(
    final res = await showMyMaterialTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
      cancelText: words['cancelPicker'],
      confirmText: words['confirm'],
      helpText: '',
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            alwaysUse24HourFormat: false,
          ),
          child: Theme(
            // data: sLightTheme,
            data: sLightTheme.copyWith(
              colorScheme: const ColorScheme.light(
                primary: Color(0xff493b30),
              ),
            ),
            child: Container(
              child: child,
            ),
          ),
        );
      },
    );
    if (res != null) {
      debugPrint(res.toString());
      setState(() {
        _data = res;
      });
    }
  }
}
