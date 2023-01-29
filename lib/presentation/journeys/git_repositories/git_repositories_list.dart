import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/utilis/message_constant.dart';
import '../../controllers/main_controller.dart';
import '../../widgets/app_error_widget.dart';
import '../../widgets/language_widget.dart';
import '../../widgets/repository_name_widget.dart';
import '../../widgets/widget_constant.dart';
import '../../../data/model/repository_list_model.dart';
import '../view_repository/repository_screen.dart';

class GitRepositoriesList extends StatelessWidget {
  const GitRepositoriesList({super.key, required this.repoList});
  final List<RepositoryListModel> repoList;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).primaryTextTheme;
    final mainCtrl = Get.find<MainController>();
    if (repoList.isEmpty) {
      return AppErrorWidget(
        msg: MessageConstant.noData,
        isRefresh: true,
        onRefresh: () {
          if (mainCtrl.tabIndex.value == 0) {
            return mainCtrl.getUserRepos();
          }
          return mainCtrl.getOrganizations();
        },
      );
    }
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: repoList.length,
        itemBuilder: (context, i) {
          final repoItem = repoList[i];
          return Container(
            decoration: WidgetConstant.cardDecoration,
            margin: WidgetConstant.generalPadding,
            padding: WidgetConstant.generalPadding,
            child: InkWell(
              onTap: () => Get.to(() => RepositoryScreen(
                    repoName: repoItem.name,
                    userName: repoItem.owner.login,
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RepositoryNameWidget(
                    repoName: repoItem.name,
                    visibility: repoItem.visibility,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    repoItem.fullName,
                    style: theme.headline2,
                  ),
                  if (repoItem.description != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        repoItem.description!,
                        style: theme.headline4,
                      ),
                    ),
                  if (repoItem.language != null)
                    LanguageWidget(language: repoItem.language!),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
