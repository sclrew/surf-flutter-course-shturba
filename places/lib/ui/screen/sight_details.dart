import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/assets.dart';
import 'package:places/ui/res/parts.dart';
import 'package:places/ui/res/strings.dart';

class SightDetails extends StatefulWidget {
  final int sightId;
  const SightDetails({
    required this.sightId,
    Key? key,
  }) : super(key: key);

  @override
  State<SightDetails> createState() => _SightDetailsState();
}

PageController _pageController = PageController();
late Sight thisSight;
double _indicatorValue = 0;

class _SightDetailsState extends State<SightDetails> {
  @override
  void initState() {
    // for (final element in mocks) {
    //   if (element.id == widget.sightId) thisSight = element;
    // }

    thisSight = mocks.firstWhere((element) => element.id == widget.sightId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        margin: const EdgeInsets.only(top: 64.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 360,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ShowImages(
                      controller: _pageController,
                      sight: thisSight,
                      thePage: (number) {
                        setState(() {
                          _indicatorValue = number.toDouble();
                        });
                      },
                    ),
                    Indicatorchik(
                      sight: thisSight,
                      onChanged: (newValue) {
                        _pageController.animateToPage(
                          newValue.toInt(),
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear,
                        );
                        setState(() {
                          _indicatorValue = newValue;
                        });
                      },
                    ),
                    // const BackButton(),
                    const Chelka(),
                    const CloseBtn(),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Theme.of(context).primaryColor,
                padding: const EdgeInsets.only(left: 16, top: 24, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      thisSight.name,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Row(
                      children: [
                        Text(
                          thisSight.type,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ],
                    ),
                    otstupH24,
                    Text(
                      thisSight.details,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    otstupH24,
                    const RouteBtn(),
                    otstupH24,
                    Container(
                      height: 0.8,
                      color: const Color(0xFF7C7E92).withOpacity(0.24),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const ScheduleAndFavoriteBtn(),
                    otstupH24,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CloseBtn extends StatelessWidget {
  const CloseBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 16,
      right: 16,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: SvgPicture.asset(assetsUrl['cardClose']!),
      ),
    );
  }
}

class Chelka extends StatelessWidget {
  const Chelka({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 12,
      child: SvgPicture.asset(assetsUrl['chelka40']!),
    );
  }
}

class ScheduleAndFavoriteBtn extends StatelessWidget {
  const ScheduleAndFavoriteBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          Flexible(
            // flex: 1,
            child: Container(
              child: Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calendar_today,
                        color: const Color(0xff7C7E92).withOpacity(0.56),
                        size: 20,
                      ),
                      const SizedBox(
                        width: 9,
                      ),
                      Text(
                        words['ToSchedule']!,
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.3,
                          color: const Color(0xff7C7E92).withOpacity(0.56),
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
                        words['ToFavorites']!,
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
    );
  }
}

class RouteBtn extends StatelessWidget {
  const RouteBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(328, 48),
        backgroundColor: const Color(0xff4CAF50),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      onPressed: () {},
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            unionImg,
            const SizedBox(
              width: 10,
            ),
            Text(
              words['BuildARoute']!.toUpperCase(),
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
    );
  }
}

class Indicatorchik extends StatelessWidget {
  final Sight sight;
  final Function(double) onChanged;

  const Indicatorchik({
    required this.sight,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 8,
        child: SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor:
                Colors.transparent, //Theme.of(context).canvasColor,
            trackHeight: 8,
            inactiveTrackColor: Colors.transparent,
            thumbColor: Theme.of(context).canvasColor,
            thumbShape: CustomSliderThumbCircle(
              thumbRadius: 76,
              max: sight.urls.length.toInt() - 1,
            ),
            overlayColor: Colors.transparent,
          ),
          child: Slider(
            onChanged: onChanged,
            value: _indicatorValue,
            max: (sight.urls.length - 1).toDouble(),
          ),
        ),
      ),
    );
  }
}

class ShowImages extends StatelessWidget {
  final PageController controller;
  final Sight sight;
  final Function(int) thePage;
  const ShowImages({
    required this.controller,
    required this.thePage,
    required this.sight,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      child: PageView(
        controller: controller,
        pageSnapping: false,
        onPageChanged: thePage,
        children: [
          for (int i = 0; sight.urls.length > i; i++)
            ShowImage(url: sight.urls[i]),
        ],
      ),
    );
  }
}

class ShowImage extends StatelessWidget {
  final String url;
  const ShowImage({
    required this.url,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // ClipRRect(
        //   borderRadius: const BorderRadius.only(
        //     topLeft: Radius.circular(16),
        //     topRight: Radius.circular(16),
        //   ),
        //   child:
        Image.network(
      url,
      fit: BoxFit.fill,
      height: 360,
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
      // ),
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 36, left: 16),
      child: SizedBox(
        height: 32,
        width: 32,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Center(
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 16,
              color: Theme.of(context).secondaryHeaderColor,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSliderThumbCircle extends SliderComponentShape {
  final double thumbRadius;
  final int min;
  final int max;

  const CustomSliderThumbCircle({
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
      ..color = const Color(0xff252849)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    final path = Path();
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(center.dx - 76, center.dy - 3.74, 152, 7.57),
        const Radius.circular(8),
      ),
    );
    // ignore: avoid_print
    // print(value.toString());
    canvas.drawPath(path, paint);
  }
}
