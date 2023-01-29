import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/main_controller.dart';
import '../../widgets/tab_widget.dart';

class TabSelector extends StatelessWidget {
  TabSelector({super.key});

  final _mainCtrl = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          thickness: 10,
        ),
        const SizedBox(
          height: 15,
        ),
        GetX<MainController>(builder: (_) {
          return Row(
            children: [
              TabWidget(
                title: 'Repositories',
                isSelected: _mainCtrl.tabIndex.value == 0,
                onTap: () {
                  _mainCtrl.tabIndex.value = 0;
                  _mainCtrl.getUserRepos();
                },
              ),
              TabWidget(
                title: 'Organizations',
                isSelected: _mainCtrl.tabIndex.value == 1,
                onTap: () {
                  _mainCtrl.tabIndex.value = 1;
                  _mainCtrl.getOrganizations();
                },
              ),
            ],
          );
        }),
        const Divider(
          thickness: 1,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
