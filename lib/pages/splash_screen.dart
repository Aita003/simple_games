import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_games/pages/home_page.dart';
import 'package:simple_games/styles/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    openHomePage();
  }

  void openHomePage() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomePage(),
      ));
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.mainColorGradient,
        ),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/game-console.png',
                      width: 200,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Simple Games',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 32,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 20, // Base font size
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(text: "Powered by "),
                      TextSpan(
                        text: "Technox",
                        style: TextStyle(
                          fontSize: 35, // Custom font size for "Technox"
                          fontFamily: "Katibeh", // Custom font family
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
