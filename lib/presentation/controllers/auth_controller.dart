import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/providers/fire_auth_provider.dart';
import '../../common/utilis/app_snack_bar.dart';
import '../../common/utilis/local_preferences.dart';
import '../../common/utilis/message_constant.dart';
import '../../data/core/app_constant.dart';
import '../../data/model/user_model.dart';
import '../journeys/home/home_screen.dart';

class AuthController extends GetxController {
  final _auth = FireAuthProvider();
  RxBool isLoading = false.obs;

  Future signInGitHub() async {
    isLoading.value = true;
    final response = await _auth.singInGitHub();
    isLoading.value = false;
    response.fold((l) => _failureMsg(l.errorMsg), (r) => _addUser(r));
  }

  void _failureMsg(String msg) => AppSnackBar.showSnackBar(
      title: 'Login Failed!',
      msg: msg,
      color: Colors.red,
      icon: const Icon(
        Icons.error,
        color: Colors.white,
      ));

  void _successMsg(String msg) => AppSnackBar.showSnackBar(
      title: 'Login Success!',
      msg: msg,
      color: Colors.green,
      icon: const Icon(
        Icons.check_circle,
        color: Colors.white,
      ));

  Future _addUser(UserCredential userCredential) async {
    final userData = {
      "userName": userCredential.additionalUserInfo?.username,
      "uid": userCredential.user?.uid,
      "email": userCredential.user?.email,
      "token": userCredential.credential?.token,
      "accessToken": userCredential.credential?.accessToken,
    };
    _successMsg(MessageConstant.successLogin);
    final user = jsonEncode(UserModel.fromJson(userData));
    await LocalPreferences.setString(AppConstant.userPreferenceKey, user);
    return Get.offAll(() => HomeScreen());
  }
}
