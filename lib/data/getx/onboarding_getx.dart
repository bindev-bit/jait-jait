import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  GetStorage onBoardingStorage = GetStorage('onBoarding');
  RxBool firstBuild = true.obs;
  RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    checkBuild();
    super.onInit();
  }

  checkBuild() {
    if (onBoardingStorage.read('firstBuild') == null ||
        !onBoardingStorage.read('firstBuild')) {
      onBoardingStorage.write('firstBuild', false);
      firstBuild.value = false;
    } else {
      onBoardingStorage.write('firstBuild', true);
      firstBuild.value = true;
    }
  }

  removeFirstBuild() {
    onBoardingStorage.write('firstBuild', true);
    firstBuild.value = true;
  }

  firstBuildScreen() {
    onBoardingStorage.write('firstBuild', false);
    firstBuild.value = false;
  }
}
