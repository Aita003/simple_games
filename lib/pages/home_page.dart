import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//component
import 'package:simple_games/component/__homepage/game_card.dart';
import 'package:simple_games/cubit/CowsAndBullsCubit/cows_bulls_cubit.dart';
//pages
import 'package:simple_games/pages/Cows%25Bulls/cows_and_bulls_view.dart';
//styles
import 'package:simple_games/styles/app_colors.dart';

//-----------------------------------------------------------------------------

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: AppColors.mainColorGradient,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Simple Games',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      GameCard(
                        gameName: 'Cows & Bulls',
                        imageSrc: 'assets/gameImages/cows&bulls.png',
                        page: BlocProvider(
                          create: (context) => CowsBullsCubit(),
                          child: const CowsAndBullsView(),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
