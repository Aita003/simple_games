import 'package:flutter/material.dart';
import 'package:simple_games/styles/app_colors.dart';

class GameCard extends StatelessWidget {
  const GameCard(
      {super.key,
      required this.gameName,
      required this.imageSrc,
      required this.page});

  final String gameName;
  final String imageSrc;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: AppColors.textColor,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3), // Shadow color
              spreadRadius: 2, // How much the shadow spreads
              blurRadius: 5, // How blurry the shadow is
              offset: const Offset(0, 3), // Offset of the shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              imageSrc,
              width: 150,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  gameName,
                  style: const TextStyle(fontSize: 24),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => page,
                    ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3), // Shadow color
                          spreadRadius: 2, // How much the shadow spreads
                          blurRadius: 5, // How blurry the shadow is
                          offset: const Offset(0, 3), // Offset of the shadow
                        ),
                      ],
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(
                        'Play',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
