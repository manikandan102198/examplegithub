import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackBar {
  static void showSnackBar({
    required String title,
    required String msg,
    required Color color,
    Widget? icon,
  }) {
    Get.snackbar(
      title,
      msg,
      icon: icon,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: color,
      borderRadius: 15,
      margin: const EdgeInsets.all(15),
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
      isDismissible: true,
    );
  }
}
