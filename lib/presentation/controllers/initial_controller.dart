import 'dart:async';

import 'package:get/get.dart';

import '../../common/utilis/local_preferences.dart';
import '../../data/core/app_constant.dart';
import '../journeys/home/home_screen.dart';
import '../journeys/login/login_screen.dart';

class InitialController extends GetxController {
  @override
  void onInit() {
    _loadWidget();
    super.onInit();
  }

  Future<Timer> _loadWidget() async {
    return Timer(const Duration(seconds: 2), navigationPage);
  }

  Future navigationPage() async {
    final user = LocalPreferences.getString(AppConstant.userPreferenceKey);
    if (user == null) return Get.offAll(() => LoginScreen());
    return Get.offAll(() => HomeScreen());
  }
}
