import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var usernameController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var birthdayController = TextEditingController().obs;
  var heightController = TextEditingController().obs;
  var weightController = TextEditingController().obs;

  RxBool showPassword = false.obs;

  @override
  void dispose() {
    usernameController.value.clear();
    emailController.value.clear();
    passwordController.value.clear();
    birthdayController.value.clear();
    heightController.value.clear();
    weightController.value.clear();
    super.dispose();
  }
}
