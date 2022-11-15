

import 'package:Star_Wars/model/character_model/model_character.dart';
import 'package:Star_Wars/model/character_model/model_film.dart';
import 'package:Star_Wars/model/character_model/model_spesies.dart';
import 'package:Star_Wars/model/character_model/model_starships.dart';
import 'package:Star_Wars/model/character_model/model_vehicle.dart';
import 'package:Star_Wars/model/new_model/film_model.dart';
import 'package:Star_Wars/model/planet_model/model_planet.dart';

class FilmState {}

class FilmInitial extends FilmState {}

class SetupFilmProgress extends FilmState {}
class SetupAllDetailFilmProgress extends FilmState {}



class SetupFilmComplete extends FilmState {
  final FilmLists res;

  SetupFilmComplete(this.res);
}

class GetUrlPlanetComplete extends FilmState {
  final List<PlanetList> url;

  GetUrlPlanetComplete(this.url);
}

class GetUrlCharacterComplete extends FilmState {
  final List<ChracterList> url;

  GetUrlCharacterComplete(this.url);
}

class GetUrlSpesiesComplete extends FilmState {
  final List<SpesiesgetList> url;

  GetUrlSpesiesComplete(this.url);
}

class GetUrlStarshipsComplete extends FilmState {
  final List<StarshipsList> url;

  GetUrlStarshipsComplete(this.url);
}

class GetUrlVehicleComplete extends FilmState {
  final List<VehicleList> url;

  GetUrlVehicleComplete(this.url);
}

class GetUrlFilmComplete extends FilmState {
  final List<ListFilmGetResp> url;

  GetUrlFilmComplete(this.url);
}

class FilmLoadMoreProgress extends FilmState {}

class FilmLoadMoreComplete extends FilmState {
  final List<Film> res;

  FilmLoadMoreComplete(this.res);
}

class FilmFailedShow extends FilmState {
  final String msg;

  FilmFailedShow(this.msg);
}
