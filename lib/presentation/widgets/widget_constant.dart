import 'package:example_app_github/presentation/themes/app_color.dart';
import 'package:flutter/material.dart';

class WidgetConstant {
  static EdgeInsets generalPadding = const EdgeInsets.all(10);

  static RoundedRectangleBorder buttonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  );

  static BoxDecoration dropDownDecoration = BoxDecoration(
    border: Border.all(width: 0.4, color: AppColor.greyColor),
    borderRadius: BorderRadius.circular(6),
  );

  static BoxDecoration cardDecoration = BoxDecoration(
    border: Border.all(width: 0.4, color: AppColor.greyColor),
    borderRadius: BorderRadius.circular(10),
  );

  static BoxDecoration chipDecoration = BoxDecoration(
    border: Border.all(width: 0.4, color: AppColor.greyColor),
    borderRadius: BorderRadius.circular(20),
  );

  static AppBar appBar(Widget title) => AppBar(
        elevation: 0.5,
        title: title,
      );
}
