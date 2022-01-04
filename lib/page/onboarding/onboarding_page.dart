import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jait_jait/components/const/color.dart';
import 'package:jait_jait/components/onboarding/custom_path.dart';
import 'package:jait_jait/data/getx/onboarding_getx.dart';
import 'package:jait_jait/page/onboarding/screen/first_onboarding_screen.dart';
import 'package:jait_jait/page/onboarding/screen/second_onboarding_screen.dart';
import 'package:animations/animations.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  OnBoardingController onBoardingController = Get.find();
  double _opacity = 0.0;

  List<Widget> listScreen = <Widget>[
    FirstOnBoardingScreen(),
    SecondOnBoardingScreen(),
  ];

  final SharedAxisTransitionType _transitionType =
      SharedAxisTransitionType.horizontal;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1), () {
      setState(() {
        _opacity = 1.0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(milliseconds: 1800),
          child: Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: ClipPath(
                    clipper: OnBoardingPath(),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 800),
                      height: 350,
                      width: MediaQuery.of(context).size.width,
                      color: onBoardingController.currentIndex.value == 0
                          ? const Color(0xffE02C51).withOpacity(.1)
                          : primaryColor.withOpacity(.3),
                    ),
                  ),
                ),
              ),
              SizedBox.expand(
                child: PageTransitionSwitcher(
                  duration: const Duration(milliseconds: 1200),
                  transitionBuilder: (child, primary, secondary) =>
                      SharedAxisTransition(
                    fillColor: Colors.transparent,
                    animation: primary,
                    secondaryAnimation: secondary,
                    transitionType: _transitionType,
                    child: child,
                  ),
                  child: listScreen[onBoardingController.currentIndex.value],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
