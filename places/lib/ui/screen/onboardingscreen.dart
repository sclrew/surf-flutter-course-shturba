import 'package:flutter/material.dart';
import 'package:places/ui/res/assets.dart';
import 'package:places/ui/res/strings.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/screen/sight_list_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

PageController _pageController = PageController();
double _pageNumber = 0;

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Stack(
            children: [
              PageView(
                controller: _pageController,
                onPageChanged: (number) {
                  setState(() {
                    _pageNumber = number.toDouble();
                  });
                },
                children: [
                  Page(
                    iconUrl: assetsUrl['welcome1']!,
                    title: words['WelcomeToGuide']!,
                    subTitle: words['FindNewLocationAndSave']!,
                    pageNumber: _pageNumber.toInt(),
                  ),
                  Page(
                    iconUrl: assetsUrl['backpack']!,
                    title: words['BuildARouteAndGo']!,
                    subTitle: words['ReachYourGoalAsPossibleFastAnd']!,
                    pageNumber: _pageNumber.toInt(),
                  ),
                  Page(
                    iconUrl: assetsUrl['fingerTap']!,
                    title: words['AddPlacesWhichIFoundMyself']!,
                    subTitle:
                        words['ShareTheMostInterestingAndHelpUsBecomeBetter']!,
                    pageNumber: _pageNumber.toInt(),
                  ),
                ],
              ),
              Positioned(
                bottom: 88,
                left: MediaQuery.of(context).size.width / 2 - 28,
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackShape: CustomTrackShape(),
                    inactiveTickMarkColor: const Color(0xff7b7d92),
                    activeTickMarkColor: const Color(0xff7b7d92),
                    activeTrackColor: Colors.transparent,
                    trackHeight: 12,
                    disabledActiveTickMarkColor: const Color(0xff7b7d92),
                    disabledInactiveTickMarkColor: const Color(0xff7b7d92),
                    inactiveTrackColor: Colors.transparent,
                    thumbColor: Theme.of(context).canvasColor,
                    thumbShape: const CustomSliderThumbRect(
                      thumbRadius: 24,
                      max: 2,
                    ),
                    overlayColor: Colors.transparent,
                  ),
                  child: SizedBox(
                    height: 12,
                    width: 52,
                    child: Slider(
                      divisions: 2,
                      max: 2,
                      value: _pageNumber,
                      onChanged: (newValue) {
                        _pageController.animateToPage(
                          newValue.toInt(),
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear,
                        );
                        setState(() {
                          _pageNumber = newValue;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (_pageNumber == 2)
                        InkWell(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute<void>(
                                builder: (context) => const SightListScreen(),
                              ),
                              (route) => false,
                            );
                          },
                          child: const StartBtn(),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StartBtn extends StatelessWidget {
  const StartBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 328,
      decoration: const BoxDecoration(
        color: Color(0xff4caf50),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Center(
        child: Text(
          words['onYourMarks']!.toUpperCase(),
          style: roboto14x700xwhite,
        ),
      ),
    );
  }
}

class Page extends StatelessWidget {
  final int pageNumber;
  final String iconUrl;
  final String title;
  final String subTitle;

  const Page({
    required this.iconUrl,
    required this.title,
    required this.subTitle,
    required this.pageNumber,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (pageNumber != 2)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 18, right: 16),
                child: InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => const SightListScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  child: Text(
                    words['Skip']!,
                    style: roboto500x16xgreen,
                  ),
                ),
              ),
            ],
          )
        else
          const SizedBox(
            height: 38,
          ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                iconUrl,
              ),
              const SizedBox(
                height: 42.6,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: roboto700x24x252849,
              ),
              const SizedBox(height: 8),
              Text(
                subTitle,
                textAlign: TextAlign.center,
                style: roboto400x14x7C7E92x1,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 48,
        ),
      ],
    );
  }
}

class CustomSliderThumbRect extends SliderComponentShape {
  final double thumbRadius;
  final int min;
  final int max;

  const CustomSliderThumbRect({
    required this.thumbRadius,
    required this.max,
    this.min = 0,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;

    final paint = Paint()
      ..color = const Color(0xff4CAF50)
      ..style = PaintingStyle.fill;

    final path = Path();
    final myRect = Rect.fromLTWH(center.dx - 12, center.dy - 4, thumbRadius, 8);

    path.addRRect(
      RRect.fromRectAndRadius(
        myRect,
        const Radius.circular(8),
      ),
    );

    canvas.drawPath(path, paint);
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    Offset offset = Offset.zero,
    bool isEnabled = false,
    bool isDiscrete = true,
  }) {
    final trackHeight = sliderTheme.trackHeight!;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight);
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
