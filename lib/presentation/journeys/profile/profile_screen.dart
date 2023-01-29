import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/utilis/share_plugin.dart';
import '../../controllers/main_controller.dart';
import '../../widgets/circular_image_widget.dart';
import '../../widgets/widget_constant.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mainCtrl = Get.find<MainController>();
    final theme = Theme.of(context).primaryTextTheme;
    return Scaffold(
      appBar: WidgetConstant.appBar(
        Text(
          "Profile",
          style: theme.headline5,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: WidgetConstant.cardDecoration,
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mainCtrl.userInfoModel!.name ??
                              mainCtrl.userInfoModel!.login,
                          overflow: TextOverflow.ellipsis,
                          style: theme.headline5,
                        ),
                        if (mainCtrl.userInfoModel!.email != null)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              mainCtrl.userInfoModel!.email.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: theme.headline3,
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CircularNetworkImageWidget(
                    radius: 30,
                    url: mainCtrl.userInfoModel!.avatarUrl.toString(),
                  ),
                ],
              ),
            ),
            ProfileItemWidget(
              count: mainCtrl.userInfoModel!.followers,
              title: 'Follower',
              icon: Icons.person_outline_outlined,
              onTap: () => null,
            ),
            ProfileItemWidget(
              count: mainCtrl.userInfoModel!.following,
              title: 'Following',
              icon: Icons.people_outline_outlined,
              onTap: () => null,
            ),
            ProfileItemWidget(
              count: mainCtrl.repoList.length,
              title: 'Repositories',
              icon: Icons.build_circle_outlined,
              onTap: () => null,
            ),
            ProfileItemWidget(
              count: mainCtrl.orgsList.length,
              title: 'Organizations',
              icon: Icons.location_city,
              onTap: () => null,
            ),
            ProfileItemWidget(
              title: 'Share',
              icon: Icons.share,
              onTap: () => SharePlugin.share(mainCtrl.userInfoModel!.htmlUrl),
            ),
            ProfileItemWidget(
              title: 'Logout',
              icon: Icons.logout_outlined,
              onTap: () => mainCtrl.logout(),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap,
      this.count});

  final String title;
  final int? count;
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).primaryTextTheme;
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        decoration: WidgetConstant.cardDecoration,
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  title,
                  style: theme.headline2,
                )
              ],
            ),
            if (count != null)
              CircleAvatar(
                radius: 13,
                backgroundColor: Colors.grey.withOpacity(0.5),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: Text(
                    count.toString(),
                    style: theme.headline2,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
