
import 'package:flutter/material.dart';
import 'package:space_app/core/constants/app_assets.dart';
import 'package:space_app/core/constants/app_colors.dart';
import 'package:space_app/features/login/presentation/widgets/button_custom.dart';

import '../../data/models/planet_data.dart';
import '../../data/models/planet_model.dart';
import '../widgets/arrow_button.dart';
import 'planet_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PageController pageController;

  int selectedIndex = 3;

  PlanetModel get selectedPlanet => PlanetData.planets[selectedIndex];

  @override
  void initState() {
    super.initState();

    pageController = PageController(
      initialPage: selectedIndex,
    );
  }

  void onPageChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void onNextTap() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void onPreviousTap() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

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
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Explore",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 70),

                  Text(
                    "Which planet\nwould you like to explore?",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                      height: 36 / 24,
                      letterSpacing: -0.03,
                    ),
                    textAlign: TextAlign.start,
                  ),

                  const SizedBox(height: 30),

                  Expanded(
                    child: Column(
                      children: [
                        // Planet Pages
                        Expanded(
                          flex: 7,
                          child: PageView.builder(
                            controller: pageController,
                            itemCount: PlanetData.planets.length,
                            onPageChanged: onPageChanged,
                            itemBuilder: (context, index) {
                              final planet = PlanetData.planets[index];

                              return Image.asset(
                                planet.image,
                                fit: BoxFit.contain,
                                width: double.infinity,
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Planet Name and Navigation Arrows
                        Row(
                          children: [
                            ArrowButton(
                              icon: Icons.arrow_back,
                              onTap: onPreviousTap,
                            ),

                            Expanded(
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 300),
                                child: Text(
                                  selectedPlanet.name,
                                  key: ValueKey(selectedPlanet.name),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),

                            ArrowButton(
                              icon: Icons.arrow_forward,
                              onTap: onNextTap,
                            ),
                          ],
                        ),

                        const Spacer(),

                        // Explore Button
                        ButtonCustom(
                          text: "Explore ${selectedPlanet.name}",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PlanetDetailsScreen(
                                  planet: selectedPlanet,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
