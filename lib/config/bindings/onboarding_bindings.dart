import 'package:get/get.dart';
import 'package:jait_jait/data/getx/auth_getx.dart';
import 'package:jait_jait/data/getx/onboarding_getx.dart';

class JaitBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnBoardingController>(() => OnBoardingController());
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
