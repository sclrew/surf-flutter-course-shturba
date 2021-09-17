import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/ui/res/assets.dart';
import 'package:places/ui/res/parts.dart';
import 'package:places/ui/screen/onboardingscreen.dart';

class SplashScreen extends StatefulWidget {
  final Future<String> isInitialized;
  const SplashScreen({
    required this.isInitialized,
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // ignore: avoid_print
    print('Я проинициализировалась и жду');
    widget.isInitialized.then((value) => _navigateToNext());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xffFCDD3D),
            Color(0xff4CAF50),
          ],
        ),
      ),
      child: Center(
        child: Image.asset(
          assetsUrl['logo']!,
        ),
      ),
    );
  }

  void _navigateToNext() {
    toPageOneWay(context, const OnboardingScreen());
  }
}
