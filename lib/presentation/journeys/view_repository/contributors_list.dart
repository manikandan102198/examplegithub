import 'package:example_app_github/data/model/contributors_model.dart';
import 'package:flutter/material.dart';

import '../../widgets/circular_image_widget.dart';
import '../../widgets/widget_constant.dart';

class ContributorsList extends StatelessWidget {
  const ContributorsList({super.key, required this.contributionList});
  final List<ContributionModel> contributionList;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).primaryTextTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('List Of Contributors', style: theme.headlineLarge),
              CircleAvatar(
                  radius: 10,
                  child: Text(contributionList.length.toString(),
                      style: theme.headline4))
            ],
          ),
          const SizedBox(height: 15),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: contributionList.length,
            itemBuilder: (context, i) {
              final orgsItem = contributionList[i];
              return Container(
                decoration: WidgetConstant.cardDecoration,
                margin: const EdgeInsets.symmetric(vertical: 6),
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
                    if (orgsItem.contributions != 0)
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Contributions : ${orgsItem.contributions}',
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
          ),
        ],
      ),
    );
  }
}
