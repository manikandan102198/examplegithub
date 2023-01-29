import 'package:example_app_github/presentation/themes/app_color.dart';
import 'package:flutter/material.dart';

import '../../../data/model/content_model.dart';
import '../../widgets/widget_constant.dart';

class ContentListWidget extends StatelessWidget {
  const ContentListWidget({super.key, required this.contentList});
  final List<ContentModel> contentList;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).primaryTextTheme;

    return DecoratedBox(
      decoration: WidgetConstant.cardDecoration,
      child: ListView.separated(
        itemCount: contentList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (_, i) => const Divider(),
        itemBuilder: (context, i) {
          final contentItem = contentList[i];
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                if (contentItem.name.contains('.'))
                  const Icon(
                    Icons.description_outlined,
                    color: Colors.grey,
                  )
                else
                  const Icon(
                    Icons.folder,
                    color: AppColor.lightBlueColor,
                  ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  contentItem.name,
                  style: theme.headline4,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
