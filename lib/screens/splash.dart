import 'package:contactsapp/utils/AppColors.dart';
import 'package:contactsapp/utils/AppImages.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.routeLogo,width: double.infinity,)
        ],
      ),
    );
  }
}
