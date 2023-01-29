import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/repository_view_model.dart';
import '../../controllers/repository_controller.dart';
import '../../widgets/chip_item_widget.dart';
import '../../widgets/language_widget.dart';
import '../../widgets/repository_name_widget.dart';
import '../../widgets/widget_constant.dart';

class RepositoryTopWidget extends StatelessWidget {
  const RepositoryTopWidget({super.key, required this.repositoryItem});
  final RepositoryViewModel repositoryItem;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).primaryTextTheme;
    final repoCtrl = Get.find<RepositoryController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RepositoryNameWidget(
          repoName: repositoryItem.fullName,
          visibility: repositoryItem.visibility,
        ),
        const SizedBox(
          height: 5,
        ),
        if (repositoryItem.parent != null)
          Text(
            'forked from ${repositoryItem.parent?.fullName}',
            style: theme.subtitle1,
          ),
        if (repositoryItem.license != null)
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
            ),
            child: Row(children: [
              const Icon(
                Icons.ac_unit,
                size: 20,
              ),
              const SizedBox(
                width: 6,
              ),
              Text(repositoryItem.license!.name, style: theme.subtitle1)
            ]),
          ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            InkWell(
              onTap: () => repoCtrl.showBranches(),
              child: Container(
                decoration: WidgetConstant.dropDownDecoration,
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Text(
                      repositoryItem.defaultBranch,
                      style: theme.headline2,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.arrow_drop_down_circle_outlined,
                      size: 13,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            if (repositoryItem.language != null &&
                repositoryItem.language!.isNotEmpty)
              LanguageWidget(
                language: repositoryItem.language!,
                top: 5,
              ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ChipItemWidget(
              count: repositoryItem.watchers,
              title: 'Watcher',
              icon: Icons.remove_red_eye_outlined,
            ),
            ChipItemWidget(
              count: repositoryItem.forksCount,
              title: 'Fork',
              icon: Icons.fork_left_outlined,
            ),
            ChipItemWidget(
              count: repositoryItem.stargazersCount,
              title: 'Star',
              icon: Icons.star_outline,
            ),
          ],
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
