import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:get/get.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class AuthController extends GetxController {
  var usernameController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var birthdayController = TextEditingController().obs;
  var heightController = TextEditingController().obs;
  var weightController = TextEditingController().obs;

  RxBool showPassword = false.obs;

  Future<void> tapLogin() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.value.text,
      password: passwordController.value.text,
    );
    _clearData();
  }

  Future<void> tapRegister() async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.value.text.trim(),
      password: passwordController.value.text,
    );

    await FirebaseChatCore.instance.createUserInFirestore(
      types.User(
        firstName: usernameController.value.text,
        id: credential.user!.uid,
        imageUrl: 'https://i.pravatar.cc/300?u=${emailController.value.text}',
      ),
    );
    _clearData();
  }

  void _clearData() {
    usernameController.value.clear();
    emailController.value.clear();
    passwordController.value.clear();
    birthdayController.value.clear();
    heightController.value.clear();
    weightController.value.clear();
  }

  @override
  void dispose() {
    _clearData();
    super.dispose();
  }
}
