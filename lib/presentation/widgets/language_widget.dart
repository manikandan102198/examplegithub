import 'package:flutter/material.dart';

import '../themes/app_color.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({super.key, required this.language,this.top = 15});
  final String language;
  final double top;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).primaryTextTheme;
    return Padding(
      padding: EdgeInsets.only(top: top),
      child: Row(
        children: [
          const Icon(
            Icons.circle,
            color: AppColor.lightGreenColor,
            size: 15,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            language,
            style: theme.headline2,
          )
        ],
      ),
    );
  }
}
