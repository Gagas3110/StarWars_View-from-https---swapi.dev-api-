

import 'package:Star_Wars/model/new_model/spesies_model.dart';

class SpesiesState {}

class SpesiesInitial extends SpesiesState {}

class SetupSpesiesProgress extends SpesiesState {}

class SetupSpesiesComplete extends SpesiesState {
  final StarWars res;

  SetupSpesiesComplete(this.res);
}

class SpesiesLoadMoreProgress extends SpesiesState {
  
}

class SpesiesLoadMoreComplete extends SpesiesState {
  final StarWars res;

  SpesiesLoadMoreComplete(this.res);
}

class SpesiesFailedShow extends SpesiesState {
   String msg;

  SpesiesFailedShow(this.msg);
}
