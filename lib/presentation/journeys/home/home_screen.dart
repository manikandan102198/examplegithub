import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/app_color.dart';
import '../../controllers/main_controller.dart';
import '../../widgets/app_circular_widget.dart';
import '../../../../common/utilis/share_plugin.dart';
import '../../widgets/app_error_widget.dart';
import '../git_organization/git_organization_list.dart';
import '../git_repositories/git_repositories_list.dart';
import 'tab_selector.dart';
import 'user_details_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final _mainCtrl = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return GetX<MainController>(builder: (_) {
      if (_mainCtrl.homePageLoading.value) {
        return const Scaffold(body: AppCircularWidget());
      }
      if (_mainCtrl.error.isNotEmpty) {
        return Scaffold(
          appBar: AppBar(),
          body: AppErrorWidget(
            msg: _mainCtrl.error.value,
            isRefresh: true,
            isLogout: true,
            onRefresh: () => _mainCtrl.getUserInfo(),
            onLogout: () => _mainCtrl.logout(),
          ),
        );
      }
      return Scaffold(
        appBar: AppBar(actions: [
          IconButton(
            icon: const Icon(
              Icons.share_outlined,
              color: AppColor.lightBlueColor,
            ),
            onPressed: () =>
                SharePlugin.share(_mainCtrl.userInfoModel!.htmlUrl),
          ),
        ]),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserDetailsWidget(),
              TabSelector(),
              if (_mainCtrl.repoLoading.value)
                SizedBox(
                    height: Get.height * 0.3, child: const AppCircularWidget())
              else if (_mainCtrl.repoOrgsError.isNotEmpty)
                AppErrorWidget(
                  msg: _mainCtrl.repoOrgsError.value,
                  isRefresh: true,
                  onRefresh: () {
                    if (_mainCtrl.tabIndex.value == 0) {
                      return _mainCtrl.getUserRepos();
                    }
                    return _mainCtrl.getOrganizations();
                  },
                )
              else if (_mainCtrl.tabIndex.value == 0)
                GitRepositoriesList(repoList: _mainCtrl.repoList)
              else if (_mainCtrl.tabIndex.value == 1)
                GitOrganizationList(orgsList: _mainCtrl.orgsList),
              const SizedBox(height: 20),
            ],
          ),
        ),
      );
    });
  }
}
