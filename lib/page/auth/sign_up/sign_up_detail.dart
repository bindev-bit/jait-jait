import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:jait_jait/components/const/color.dart';
import 'package:jait_jait/data/getx/auth_getx.dart';
import 'package:jait_jait/data/getx/onboarding_getx.dart';
import 'package:jait_jait/page/home/home_page.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SignUpDetailPage extends StatefulWidget {
  SignUpDetailPage({Key? key}) : super(key: key);

  @override
  State<SignUpDetailPage> createState() => _SignUpDetailPageState();
}

class _SignUpDetailPageState extends State<SignUpDetailPage> {
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
                        onTap: () async {
                          final DateTime? selected = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2010),
                            lastDate: DateTime(2025),
                          );

                          if (selected != null && selected != DateTime.now()) {
                            controller.birthdayController.value.text =
                                "${selected.day}/${selected.month}/${selected.year}";
                          }
                        },
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
                          keyboardType: TextInputType.number,
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
                          keyboardType: TextInputType.number,
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
                    try {
                      await controller.tapRegister();
                      EasyLoading.dismiss();
                      onBoardingController.removeFirstBuild();
                      await Future.delayed(const Duration(milliseconds: 500),
                          () {
                        return Get.to(
                          const HomePage(),
                          transition: Transition.rightToLeftWithFade,
                          duration: const Duration(
                            milliseconds: 1200,
                          ),
                        );
                      });
                    } catch (e) {
                      EasyLoading.dismiss();
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
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
