import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jait_jait/components/onboarding/onboarding_header.dart';
import 'package:jait_jait/components/onboarding/onboarding_screen.dart';
import 'package:jait_jait/data/getx/onboarding_getx.dart';
import 'package:jait_jait/page/auth/sign_in.dart';

class SecondOnBoardingScreen extends StatelessWidget {
  SecondOnBoardingScreen({Key? key}) : super(key: key);
  final OnBoardingController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return OnBoardingScreen(
      header: const OnBoardingHeader(
        title: "Find Trustworthy Fashion Desainer",
        subTitle:
            "You will get the most accurate desain from top local fashion desainer",
      ),
      image: 'assets/img/splash_2.png',
      button: ElevatedButton(
        onPressed: () => Get.to(
          SignInPage(),
          transition: Transition.rightToLeftWithFade,
          duration: const Duration(milliseconds: 1200),
        ),
        child: const Text("Get Started"),
      ),
    );
  }
}
