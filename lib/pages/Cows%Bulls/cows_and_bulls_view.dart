import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_games/component/__cowsAndBulls/number_card.dart';
import 'package:simple_games/component/loading_component.dart';
import 'package:simple_games/cubit/CowsAndBullsCubit/cows_bulls_cubit.dart';
import 'package:simple_games/cubit/CowsAndBullsCubit/cows_bulls_state.dart';
import 'package:simple_games/styles/app_colors.dart';

class CowsAndBullsView extends StatefulWidget {
  const CowsAndBullsView({super.key});

  @override
  State<CowsAndBullsView> createState() => _CowsAndBullsViewState();
}

class _CowsAndBullsViewState extends State<CowsAndBullsView> {
  final _formKey = GlobalKey<FormState>();

  final _firstNumberController = TextEditingController();
  final _secondNumberController = TextEditingController();
  final _thirdNumberController = TextEditingController();
  final _forthNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CowsBullsCubit>(context).generateRandomNumber();
  }

  @override
  void dispose() {
    _firstNumberController.dispose();
    _secondNumberController.dispose();
    _thirdNumberController.dispose();
    _forthNumberController.dispose();
    super.dispose();
  }

  void _handleGuess() {
    if (_formKey.currentState!.validate()) {
      // All fields are valid, proceed with the guess
      final number = _firstNumberController.text +
          _secondNumberController.text +
          _thirdNumberController.text +
          _forthNumberController.text;

      BlocProvider.of<CowsBullsCubit>(context).checkCowsBulls(number);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid Input'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<CowsBullsCubit, CowsBullsState>(
          listener: (context, state) {
            if (state is CowsBullsErorr) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
            if (state is CowsBullsWin) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('you Win'),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is CowsBullsLoading) {
              return const LoadingComponent();
            }
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: AppColors.mainColorGradient,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Cows : ',
                            style: TextStyle(
                              fontSize: 32,
                              color: AppColors.textColor,
                            ),
                          ),
                          Text(
                            BlocProvider.of<CowsBullsCubit>(context)
                                .cows
                                .toString(),
                            style: TextStyle(
                              fontSize: 32,
                              color: AppColors.textColor,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Bulls : ',
                            style: TextStyle(
                              fontSize: 32,
                              color: AppColors.textColor,
                            ),
                          ),
                          Text(
                            BlocProvider.of<CowsBullsCubit>(context)
                                .bulls
                                .toString(),
                            style: TextStyle(
                              fontSize: 32,
                              color: AppColors.textColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          NumberCard(controller: _firstNumberController),
                          NumberCard(controller: _secondNumberController),
                          NumberCard(controller: _thirdNumberController),
                          NumberCard(controller: _forthNumberController),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      GestureDetector(
                        onTap: _handleGuess, // Handle "Guess" button press
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.buttonColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.3), // Shadow color
                                spreadRadius: 2, // How much the shadow spreads
                                blurRadius: 5, // How blurry the shadow is
                                offset:
                                    const Offset(0, 3), // Offset of the shadow
                              ),
                            ],
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Text(
                              "Guess",
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
