import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/repository_controller.dart';

class ListOfBranches extends StatelessWidget {
  const ListOfBranches({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).primaryTextTheme;
    final repoCtrl = Get.find<RepositoryController>();
    return SizedBox(
      height: Get.height * 0.4,
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('List Of Branches', style: theme.headlineLarge),
                InkWell(
                  onTap: () => Get.back(),
                  child: CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.grey.withOpacity(0.5),
                      child: const Icon(
                        Icons.close,
                        color: Colors.black,
                        size: 15,
                      )),
                )
              ],
            ),
          ),
          const Divider(),
          const SizedBox(
            height: 7,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: repoCtrl.branches.length,
            itemBuilder: (context, i) => InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.description_outlined,
                      size: 18,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        repoCtrl.branches[i]['name'].toString(),
                        overflow: TextOverflow.ellipsis,
                        style: theme.headline5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
