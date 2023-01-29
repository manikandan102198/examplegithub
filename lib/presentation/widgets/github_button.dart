import 'package:flutter/material.dart';

import 'widget_constant.dart';

class GitHubButton extends StatelessWidget {
  const GitHubButton(
      {super.key,
      required this.title,
      required this.backgroundColor,
      required this.onTap,
      this.elevation,
      this.width,
      this.textStyle});
  final String title;
  final Color backgroundColor;
  final Function onTap;
  final double? width;
  final double? elevation;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).primaryTextTheme;
    return MaterialButton(
      height: 45,
      minWidth: width,
      elevation: elevation,
      shape: WidgetConstant.buttonShape,
      onPressed: () => onTap(),
      color: backgroundColor,
      child: Text(
        title,
        style: textStyle ?? textTheme.headline1,
      ),
    );
  }
}
