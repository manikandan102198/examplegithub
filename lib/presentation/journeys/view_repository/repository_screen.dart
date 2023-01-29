import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/repository_controller.dart';
import '../../widgets/app_circular_widget.dart';
import '../../widgets/app_error_widget.dart';
import '../../widgets/widget_constant.dart';
import 'content_list.dart';
import 'contributors_list.dart';
import 'repository_top_widget.dart';

class RepositoryScreen extends StatefulWidget {
  const RepositoryScreen(
      {super.key, required this.repoName, required this.userName});
  final String repoName;
  final String userName;
  @override
  State<RepositoryScreen> createState() => _RepositoryScreenState();
}

class _RepositoryScreenState extends State<RepositoryScreen> {
  final _repoCtrl = Get.put(RepositoryController());

  @override
  void initState() {
    super.initState();
    _repoCtrl.getRepoInfos(widget.userName, widget.repoName);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).primaryTextTheme;
    return Scaffold(
      appBar: WidgetConstant.appBar(
        Text(
          widget.repoName,
          style: theme.headline5,
        ),
      ),
      body: GetBuilder<RepositoryController>(
        id: 'repo',
        builder: (_) {
          if (_repoCtrl.isLoading.value) {
            return const AppCircularWidget();
          }
          if (_repoCtrl.error.isNotEmpty) {
            return AppErrorWidget(
              msg: _repoCtrl.error.value,
              isRefresh: true,
              onRefresh: () =>
                  _repoCtrl.getRepoInfos(widget.userName, widget.repoName),
            );
          }
          final repositoryItem = _repoCtrl.repositoryViewModel;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RepositoryTopWidget(
                  repositoryItem: repositoryItem,
                ),
                ContentListWidget(
                  contentList: _repoCtrl.contentModel,
                ),
                if (_repoCtrl.contributorsList.isNotEmpty)
                  ContributorsList(
                    contributionList: _repoCtrl.contributorsList,
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}
