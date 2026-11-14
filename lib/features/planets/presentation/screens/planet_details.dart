import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../data/models/planet_model.dart';
import '../widgets/arrow_button.dart';

class PlanetDetailsScreen extends StatelessWidget {
  final PlanetModel planet;
  const PlanetDetailsScreen({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,

      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Image.asset(
              AppAssets.topBackground,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Image.asset(
              AppAssets.topLinearGradient,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ArrowButton(
                            icon: Icons.arrow_back,
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          Flexible(
                            child: Text(
                              planet.name,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: .bold,
                                color: AppColors.white,
                              ),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(width: 46),
                        ],
                      ),
                      SizedBox(height: 50),
                      Text(
                        planet.title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: .bold,
                          color: AppColors.white,
                          height: 36 / 24,
                          letterSpacing: -0.03,
                        ),

                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 20),
                      // 3D Planet Model
                      SizedBox(
                        height: 343,
                        width: double.infinity,
                        child: Flutter3DViewer(
                          key: ValueKey(planet.name),
                          src: planet.model3D,
                          activeGestureInterceptor: true,
                          enableTouch: true,
                          progressBarColor: AppColors.white,
                          onLoad: (modelAddress) {
                            debugPrint('3D Model Loaded: $modelAddress');
                          },
                          onError: (error) {
                            debugPrint('3D Model Error: $error');
                          },
                        ),
                      ),

                      SizedBox(height: 30),
                      Text(
                        "About",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: .bold,
                          color: AppColors.white,
                          height: 36 / 24,
                        ),

                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 8),
                      Text(
                        planet.about,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: .w300,
                          color: AppColors.white,
                          height: 22 / 16,
                        ),

                        textAlign: TextAlign.start,
                      ),

                      SizedBox(height: 20),

                      Text(
                        "Distance from Sun (km) : ${planet.distanceFromSun}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: .bold,
                          color: AppColors.white,
                          height: 36 / 16,
                          letterSpacing: -0.03,
                        ),

                        textAlign: TextAlign.start,
                      ),

                      SizedBox(height: 8),
                      Text(
                        "Length of Day (hours) : ${planet.lengthOfDay}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: .bold,
                          color: AppColors.white,
                          height: 36 / 16,
                          letterSpacing: -0.03,
                        ),

                        textAlign: TextAlign.start,
                      ),

                      SizedBox(height: 8),
                      Text(
                        "Orbital Period (Earth years) : ${planet.orbitalPeriod}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: .bold,
                          color: AppColors.white,
                          height: 36 / 16,
                          letterSpacing: -0.03,
                        ),

                        textAlign: TextAlign.start,
                      ),

                      SizedBox(height: 8),
                      Text(
                        "Radius (km) : ${planet.radius}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: .bold,
                          color: AppColors.white,
                          height: 36 / 16,
                          letterSpacing: -0.03,
                        ),

                        textAlign: TextAlign.start,
                      ),

                      SizedBox(height: 8),
                      Text(
                        "Mass (kg) : ${planet.mass}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: .bold,
                          color: AppColors.white,
                          height: 36 / 16,
                          letterSpacing: -0.03,
                        ),

                        textAlign: TextAlign.start,
                      ),

                      SizedBox(height: 8),
                      Text(
                        "Gravity (m/s²) : ${planet.gravity}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: .bold,
                          color: AppColors.white,
                          height: 36 / 16,
                          letterSpacing: -0.03,
                        ),

                        textAlign: TextAlign.start,
                      ),

                      SizedBox(height: 8),
                      Text(
                        "Surface Area (km²) : ${planet.surfaceArea}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: .bold,
                          color: AppColors.white,
                          height: 36 / 16,
                          letterSpacing: -0.03,
                        ),

                        textAlign: TextAlign.start,
                      ),

                      SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
