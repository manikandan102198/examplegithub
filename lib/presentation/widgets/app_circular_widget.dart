import 'package:flutter/material.dart';

class AppCircularWidget extends StatelessWidget {
  const AppCircularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(
        strokeWidth: 2,
      ),
    );
  }
}
