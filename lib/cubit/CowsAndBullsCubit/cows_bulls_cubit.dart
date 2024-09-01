// package
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';
//state
import 'package:simple_games/cubit/CowsAndBullsCubit/cows_bulls_state.dart';

//-------------------------------------------------------------------------

class CowsBullsCubit extends Cubit<CowsBullsState> {
  CowsBullsCubit() : super(CowsBullsInitial());

  String? randomNumber;
  int cows = 0;
  int bulls = 0;

  void generateRandomNumber() {
    emit(CowsBullsLoading());
    try {
      final random = Random();
      randomNumber = (1000 + random.nextInt(9000))
          .toString(); // Generates a random number between 1000 and 9999
      emit(CowsBullsSuccess());
    } catch (e) {
      emit(CowsBullsErorr(e.toString()));
    }
  }

  void checkCowsBulls(String guess) {
    emit(CowsBullsLoading());
    cows = 0;
    bulls = 0;

    for (int i = 0; i < 4; i++) {
      if (guess[i] == randomNumber![i]) {
        cows++;
      } else if (randomNumber!.contains(guess[i])) {
        bulls++;
      }
    }
    if (cows == 4) {
      emit(CowsBullsWin());
    } else {
      emit(CowsBullsSuccess());
    }
  }
}
