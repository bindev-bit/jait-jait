import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:jait_jait/data/getx/onboarding_getx.dart';
import 'package:jait_jait/page/onboarding/onboarding_page.dart';

import 'home/home_page.dart';

class Root extends GetWidget<OnBoardingController> {
  const Root({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Get.find<OnBoardingController>().firstBuild.value
          ? const HomePage()
          : const OnBoardingPage(),
    );
  }
}
