import 'package:flutter/material.dart';

import 'widget_constant.dart';

class ChipItemWidget extends StatelessWidget {
  const ChipItemWidget(
      {super.key,
      required this.title,
      required this.icon,
      required this.count});
  final String title;
  final IconData icon;
  final int count;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).primaryTextTheme;
    return Container(
      decoration: WidgetConstant.cardDecoration,
      padding: const EdgeInsets.all(4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.grey, size: 16),
          const SizedBox(width: 4),
          Text('$title $count', style: theme.bodyText1),
        ],
      ),
    );
  }
}
