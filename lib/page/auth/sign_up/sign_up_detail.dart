import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:jait_jait/components/const/color.dart';
import 'package:jait_jait/data/getx/auth_getx.dart';
import 'package:jait_jait/page/home/home_page.dart';

class SignUpDetailPage extends StatelessWidget {
  SignUpDetailPage({Key? key}) : super(key: key);
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
                          text: 'Complete your profile\n',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        TextSpan(text: "Let's start with the basics"),
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
                        controller: controller.birthdayController.value,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          label: const Text("Date of Birthday"),
                          hintText: 'Pick your birthday',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Material(
                        type: MaterialType.transparency,
                        child: TextFormField(
                          controller: controller.heightController.value,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            label: const Text("Height"),
                            hintText: '0.0',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Material(
                        type: MaterialType.transparency,
                        child: TextFormField(
                          controller: controller.weightController.value,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            label: const Text("Weight"),
                            hintText: '0.0',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
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

  Padding _buttonBottom() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          TextButton(
            child: const Text("Previous"),
            onPressed: () => Get.back(),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Hero(
              tag: 'auth-button',
              child: ElevatedButton(
                child: const Text("Get started"),
                onPressed: () async {
                  EasyLoading.show();
                  await Future.delayed(const Duration(milliseconds: 500), () {
                    EasyLoading.dismiss();
                    return Get.to(
                      HomePage(),
                      transition: Transition.rightToLeftWithFade,
                      duration: const Duration(
                        milliseconds: 1200,
                      ),
                    );
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
