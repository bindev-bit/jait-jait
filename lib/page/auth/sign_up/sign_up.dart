import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jait_jait/components/const/color.dart';
import 'package:jait_jait/data/getx/auth_getx.dart';
import 'package:jait_jait/page/auth/sign_up/sign_up_detail.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  final AuthController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: Get.height / 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10,
              ),
              child: Hero(
                  tag: 'logo',
                  child: Image.asset('assets/icon/logo_jaitjait.png')),
            ),
            Hero(
              tag: 'auth-banner',
              child: Material(
                type: MaterialType.transparency,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: secondaryColor.withOpacity(.3),
                  ),
                  child: const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Create an account\n',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        TextSpan(text: 'Start a healthy journey with us'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Obx(
              () => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        controller: controller.usernameController.value,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          label: const Text("Username"),
                          hintText: 'Pick your unique username',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Hero(
                      tag: 'auth-email',
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Material(
                          type: MaterialType.transparency,
                          child: TextFormField(
                            controller: controller.emailController.value,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              label: const Text("Email"),
                              hintText: 'Input your email address',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Hero(
                      tag: 'auth-password',
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Material(
                          type: MaterialType.transparency,
                          child: TextFormField(
                            controller: controller.passwordController.value,
                            obscureText: !controller.showPassword.value,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  controller.showPassword.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: primaryColor,
                                ),
                                onPressed: () {
                                  controller.showPassword.value =
                                      !controller.showPassword.value;
                                },
                              ),
                              label: const Text("Password"),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buttonBottom(),
          ],
        ),
      ),
    );
  }

  Column _buttonBottom() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Hero(
          tag: 'auth-button',
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ElevatedButton(
              child: const Text("Next"),
              onPressed: () => Get.to(
                SignUpDetailPage(),
                transition: Transition.rightToLeftWithFade,
                duration: const Duration(
                  milliseconds: 1200,
                ),
              ),
            ),
          ),
        ),
        Hero(
          tag: 'auth-textButton',
          child: Center(
            child: TextButton(
              child: const Text(
                "Already an account ?",
                style: TextStyle(
                  color: Color(0xffF99441),
                ),
              ),
              onPressed: () => Get.back(),
            ),
          ),
        ),
      ],
    );
  }
}
