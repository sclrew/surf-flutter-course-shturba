import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WishSightEmpty extends StatelessWidget {
  const WishSightEmpty({Key? key}) : super(key: key);

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
          style: GoogleFonts.roboto(
            color: const Color(0xff7C7E92).withOpacity(0.56),
            fontSize: 18,
            height: 1.28,
            fontWeight: FontWeight.w500,
          ),
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
