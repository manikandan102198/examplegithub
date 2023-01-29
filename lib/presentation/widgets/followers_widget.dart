import 'package:flutter/material.dart';

class FollowersWidget extends StatelessWidget {
  const FollowersWidget({super.key, required this.icon, required this.length});
  final IconData icon;
  final int length;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).primaryTextTheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.grey,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          length.toString(),
          style: theme.bodyText1,
        ),
        Text(
          ' follower',
          style: theme.bodyText2,
        ),
      ],
    );
  }
}
