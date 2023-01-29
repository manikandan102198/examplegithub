import 'package:flutter/material.dart';

import '../themes/app_color.dart';

class TabWidget extends StatelessWidget {
  const TabWidget(
      {super.key,
      required this.onTap,
      required this.isSelected,
      required this.title});
  final Function onTap;
  final bool isSelected;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).primaryTextTheme;
    return Expanded(
      child: InkWell(
        onTap: () => onTap(),
        child: Column(
          children: [
            const SizedBox(height: 5),
            Text(
              title,
              textAlign: TextAlign.center,
              style: theme.headline5,
            ),
            const SizedBox(
              height: 10,
            ),
            if (isSelected)
              AnimatedContainer(
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                decoration: BoxDecoration(
                    color: AppColor.primaryOrangeColor,
                    borderRadius: BorderRadius.circular(3)),
                height: 5,
                margin: const EdgeInsets.symmetric(horizontal: 20),
              )
          ],
        ),
      ),
    );
  }
}
