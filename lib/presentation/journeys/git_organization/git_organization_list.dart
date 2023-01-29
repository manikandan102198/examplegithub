import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/utilis/message_constant.dart';
import '../../../data/model/organization_list_model.dart';
import '../../controllers/main_controller.dart';
import '../../widgets/app_error_widget.dart';
import '../../widgets/circular_image_widget.dart';
import '../../widgets/widget_constant.dart';

class GitOrganizationList extends StatelessWidget {
  const GitOrganizationList({super.key, required this.orgsList});
  final List<OrganizationListModel> orgsList;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).primaryTextTheme;
    final mainCtrl = Get.find<MainController>();
    if (orgsList.isEmpty) {
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
      itemCount: orgsList.length,
      itemBuilder: (context, i) {
        final orgsItem = orgsList[i];
        return Container(
          decoration: WidgetConstant.cardDecoration,
          margin: WidgetConstant.generalPadding,
          padding: WidgetConstant.generalPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircularNetworkImageWidget(
                    radius: 20,
                    url: orgsItem.avatarUrl,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    orgsItem.login,
                    style: theme.headline5,
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                orgsItem.url,
                style: theme.subtitle2,
              ),
              if (orgsItem.description != null && orgsItem.description != '')
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    orgsItem.description!,
                    style: theme.headline4,
                  ),
                ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        );
      },
    );
  }
}
