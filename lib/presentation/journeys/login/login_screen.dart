import 'package:example_app_github/presentation/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/github_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _authCtrl = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).primaryTextTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              Image.asset(
                'assets/images/github-dark.png',
                height: Get.height * 0.2,
                fit: BoxFit.cover,
                color: Colors.black,
              ),
              const Spacer(),
              GetX<AuthController>(builder: (_) {
                if (_authCtrl.isLoading.value) {
                  return const CircularProgressIndicator.adaptive(
                    strokeWidth: 2,
                  );
                }
                return GitHubButton(
                  width: Get.width - 30,
                  title: 'SIGN IN WITH GITHUB',
                  onTap: () => _authCtrl.signInGitHub(),
                  backgroundColor: Colors.black,
                );
              }),
              const SizedBox(
                height: 12,
              ),
              GitHubButton(
                title: 'SIGN IN WITH GITHUB ENTERPRISE',
                onTap: () => null,
                elevation: 0.5,
                width: Get.width - 30,
                backgroundColor: Colors.white,
                textStyle: textTheme.headline2,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: RichText(
                  softWrap: true,
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'By signing in your accept our ',
                    style: textTheme.subtitle1,
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Terms of use', style: textTheme.subtitle2),
                      const TextSpan(text: ' and\n'),
                      TextSpan(
                          text: 'Privacy policy', style: textTheme.subtitle2),
                      const TextSpan(text: '.'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
