import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jait_jait/components/onboarding/onboarding_header.dart';
import 'package:jait_jait/components/onboarding/onboarding_screen.dart';
import 'package:jait_jait/data/getx/onboarding_getx.dart';

class FirstOnBoardingScreen extends StatelessWidget {
  FirstOnBoardingScreen({Key? key}) : super(key: key);

  final OnBoardingController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return OnBoardingScreen(
      header: const OnBoardingHeader(
        title: "Get Instant Consult From Your Preferred Modiste",
        subTitle:
            "Now you can speak to your preferred modiste through chat/voice call/ video call",
      ),
      image: 'assets/img/splash_1.png',
      button: ElevatedButton(
        onPressed: () {
          controller.currentIndex.value = 1;
        },
        child: const Text("Next"),
        style: ElevatedButton.styleFrom(
          primary: const Color(0xffE02C51),
        ),
      ),
    );
  }
}
