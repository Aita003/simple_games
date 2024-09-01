//models

//-----------------------------------------------------------------

class CowsBullsState {}

class CowsBullsInitial extends CowsBullsState {}

class CowsBullsLoading extends CowsBullsState {}

class CowsBullsErorr extends CowsBullsState {
  final String message;
  CowsBullsErorr(this.message);
}

class CowsBullsSuccess extends CowsBullsState {}

class CowsBullsWin extends CowsBullsState {}
