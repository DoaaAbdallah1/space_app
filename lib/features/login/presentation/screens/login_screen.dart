import 'package:flutter/material.dart';
import 'package:space_app/core/constants/app_assets.dart';
import 'package:space_app/core/constants/app_colors.dart';

import '../../../planets/presentation/screens/home.dart';
import '../widgets/button_custom.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          Positioned(
            bottom: 1,
            top: 1,
            left: 0,
            child: Center(
              child: Image.asset(
                AppAssets.leftBackground,
                height: MediaQuery.of(context).size.height * 0.96,
              ),
            ),
          ),
          Positioned(
            bottom: 1,
            top: 1,
            left: 16,
            right: 130,

            child: Center(
              child: Text(
                "Explore The Universe",
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: .w900,
                  color: AppColors.white,
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Positioned(
            bottom: 16,

            right: 16,
            left: 16,
            child: SafeArea(
              child: ButtonCustom(
                text: "Explore",
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
