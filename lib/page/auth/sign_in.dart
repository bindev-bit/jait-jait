import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:jait_jait/components/const/color.dart';
import 'package:jait_jait/data/getx/auth_getx.dart';
import 'package:jait_jait/data/getx/onboarding_getx.dart';
import 'package:jait_jait/page/auth/sign_up/sign_up.dart';
import 'package:jait_jait/page/home/home_page.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final AuthController controller = Get.find();

  final OnBoardingController onBoardingController = Get.find();

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
              height: Get.height / 4.5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10,
              ),
              child: Hero(
                tag: 'logo',
                child: Image.asset('assets/icon/logo_jaitjait.png'),
              ),
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
                          text: 'Welcome Back\n',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        TextSpan(text: 'Log in to continue'),
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              TextButton(
                child: const Text("Forgot password ?"),
                onPressed: () {},
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Hero(
                  tag: 'auth-button',
                  child: ElevatedButton(
                    child: const Text("Login"),
                    onPressed: () async {
                      EasyLoading.show();

                      try {
                        await controller.tapLogin();

                        onBoardingController.removeFirstBuild();
                        await Future.delayed(const Duration(milliseconds: 500),
                            () {
                          EasyLoading.dismiss();
                          return Get.to(
                            const HomePage(),
                            transition: Transition.rightToLeftWithFade,
                            duration: const Duration(
                              milliseconds: 1200,
                            ),
                          );
                        });
                      } catch (e) {
                        await showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                            content: Text(
                              e.toString(),
                            ),
                            title: const Text('Error'),
                          ),
                        );
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
        Hero(
          tag: 'auth-textButton',
          child: Center(
            child: TextButton(
              child: const Text(
                "Create an account",
                style: TextStyle(
                  color: Color(0xffF99441),
                ),
              ),
              onPressed: () => Get.to(
                SignUpPage(),
                transition: Transition.rightToLeftWithFade,
                duration: const Duration(
                  milliseconds: 1200,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
