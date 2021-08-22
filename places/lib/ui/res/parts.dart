import 'package:flutter/material.dart';
import 'package:places/ui/res/style.dart';

Widget heartImg = Image.asset(
  'assets/img/heart.png',
  width: 20,
  height: 18,
);

Widget unionImg = Image.asset(
  'assets/img/union.png',
  width: 20,
  height: 22,
);

Widget otstupW25 = const SizedBox(
  width: 25,
);

Widget otstupH40 = const SizedBox(
  height: 40,
);

Widget otstupH36 = const SizedBox(
  height: 36,
);

Widget otstupH30 = const SizedBox(
  height: 30,
);

Widget otstupH24 = const SizedBox(
  height: 24,
);

Widget otstupH12 = const SizedBox(
  height: 12,
);

Widget calendarImg24 = Image.asset(
  'assets/img/calendar.png',
  width: 24,
  height: 24,
);

Widget hr08 = Container(
  height: 0.8,
  color: const Color(0xff7C7E92).withOpacity(0.56),
  margin: const EdgeInsets.only(bottom: 14),
);

Widget shareImg24 = Image.asset(
  'assets/img/share.png',
  width: 24,
  height: 24,
);

Widget closeIcon22 = const Icon(
  Icons.close,
  size: 22,
  color: Colors.white,
);

class MenuElement extends StatelessWidget {
  final bool isActive;
  final String nazvanie;
  final String imgUrl;
  final Function() onTap;

  const MenuElement({
    required this.isActive,
    required this.nazvanie,
    required this.imgUrl,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 92,
          child: Column(
            children: [
              ElevatedButton(
                style: buttonGreenCircle,
                onPressed: onTap,
                child: Image.asset(imgUrl),
              ),
              otstupH12,
              Text(
                nazvanie,
                style: roboto400x12,
              ),
            ],
          ),
        ),
        if (isActive == true)
          Container(
            height: 16,
            width: 16,
            margin: const EdgeInsets.only(left: 48, top: 48),
            child: Image.asset('assets/img/checked.png'),
            decoration: const BoxDecoration(
              color: Color(0xff252849),
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }
}

class SRichText extends StatelessWidget {
  final String sText;
  final TextStyle sTextStyle;

  const SRichText({required this.sText, required this.sTextStyle, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: sTextStyle,
        children: <TextSpan>[
          TextSpan(
            text: sText,
            style: TextStyle(
              color: Theme.of(context).canvasColor,
            ),
          ),
        ],
      ),
    );
  }
}
