import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VisitedSightEmpty extends StatelessWidget {
  const VisitedSightEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.add_location_alt_outlined,
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
          'Отмечайте понравившиеся\n места и они появятся здесь.',
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
