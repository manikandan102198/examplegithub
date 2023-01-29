import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget(
      {super.key,
      required this.msg,
      this.isLogout = false,
      this.isRefresh = false,
      this.onLogout,
      this.onRefresh});
  final String msg;
  final bool isLogout;
  final bool isRefresh;
  final Function? onLogout;
  final Function? onRefresh;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).primaryTextTheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/github-dark.png',
            height: Get.height * 0.15,
            fit: BoxFit.cover,
            color: Colors.black,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            msg,
            style: theme.headline5,
          ),
          const SizedBox(
            height: 10,
          ),
          if (isRefresh)
            OutlineButtonWidget(
              color: Colors.blue,
              title: 'Refresh',
              onTap: () => onRefresh!(),
              icon: Icons.refresh_outlined,
            ),
          if (isLogout) const Text('(or)'),
          if (isLogout)
            OutlineButtonWidget(
              color: Colors.red,
              title: 'Logout',
              onTap: () => onLogout!(),
              icon: Icons.logout_outlined,
            ),
        ],
      ),
    );
  }
}

class OutlineButtonWidget extends StatelessWidget {
  const OutlineButtonWidget(
      {super.key,
      required this.onTap,
      required this.title,
      required this.icon,
      required this.color});
  final Function onTap;
  final String title;
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: OutlinedButton(
        onPressed: () => onTap(),
        child: Row(
          children: [
            Icon(
              icon,
              color: color,
              size: 20,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(
                  color: color, fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
