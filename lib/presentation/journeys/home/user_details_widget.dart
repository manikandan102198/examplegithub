import 'package:example_app_github/presentation/controllers/main_controller.dart';
import 'package:example_app_github/presentation/journeys/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/circular_image_widget.dart';
import '../../widgets/followers_widget.dart';

class UserDetailsWidget extends StatelessWidget {
  UserDetailsWidget({super.key});
  final _mainCtrl = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).primaryTextTheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () => Get.to(() => const ProfileScreen()),
                child: CircularNetworkImageWidget(
                  radius: 50,
                  url: _mainCtrl.userInfoModel!.avatarUrl.toString(),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _mainCtrl.userInfoModel!.name ??
                          _mainCtrl.userInfoModel!.login,
                      overflow: TextOverflow.ellipsis,
                      style: theme.headline3,
                    ),
                    if (_mainCtrl.userInfoModel!.email != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          _mainCtrl.userInfoModel!.email.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: theme.headline3,
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              FollowersWidget(
                icon: Icons.person_outline_outlined,
                length: _mainCtrl.userInfoModel!.followers,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 7),
                child: Icon(
                  Icons.circle,
                  color: Colors.black,
                  size: 3,
                ),
              ),
              FollowersWidget(
                icon: Icons.group_outlined,
                length: _mainCtrl.userInfoModel!.following,
              ),
            ],
          ),
          if (_mainCtrl.userInfoModel!.bio != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                _mainCtrl.userInfoModel!.bio.toString(),
                textAlign: TextAlign.start,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: theme.headline4,
              ),
            ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
