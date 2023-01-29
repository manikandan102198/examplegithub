import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget_constant.dart';

class RepositoryNameWidget extends StatelessWidget {
  const RepositoryNameWidget(
      {super.key, required this.repoName, required this.visibility});
  final String repoName;
  final String visibility;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).primaryTextTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          repoName,
          style: theme.headline5,
        ),
        DecoratedBox(
          decoration: WidgetConstant.chipDecoration,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Text(
              visibility.capitalizeFirst.toString(),
              style: theme.headline6,
            ),
          ),
        ),
      ],
    );
  }
}
