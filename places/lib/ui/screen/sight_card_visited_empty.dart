import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:places/ui/res/text_styles.dart';

class VisitedSightEmpty extends StatelessWidget {
  const VisitedSightEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.not_listed_location,
          size: 80,
        ),
        const SizedBox(height: 32),
        Text(
          'Пусто',
          style: roboto500x18x7C7E92,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Завершите маршрут\n чтобы место попало сюда.',
          style: GoogleFonts.roboto(
            color: const Color(0xff7C7E92).withOpacity(0.56),
            fontSize: 14,
            height: 1.33,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
