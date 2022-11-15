import 'package:Star_Wars/bloc/event/starWars_film_event.dart';
import 'package:Star_Wars/bloc/state/starWars_film_state.dart';
import 'package:Star_Wars/model/character_model/model_character.dart';
import 'package:Star_Wars/model/character_model/model_film.dart';
import 'package:Star_Wars/model/character_model/model_spesies.dart';
import 'package:Star_Wars/model/character_model/model_starships.dart';
import 'package:Star_Wars/model/character_model/model_vehicle.dart';

import 'package:Star_Wars/model/new_model/film_model.dart';
import 'package:Star_Wars/model/planet_model/model_planet.dart';
import 'package:Star_Wars/service/rest_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class FilmBloc extends Bloc<FilmEvent, FilmState> {
  FilmLists result = FilmLists();
  PlanetList pln1 = PlanetList();
  ChracterList char = ChracterList();
  SpesiesgetList spes = SpesiesgetList();
  StarshipsList star = StarshipsList();
  VehicleList vec = VehicleList();
  ListFilmGetResp fil = ListFilmGetResp();

  List<PlanetList> listplan = [];
  List<ChracterList> listchar = [];
  List<SpesiesgetList> listspes = [];
  List<StarshipsList> liststar = [];
  List<VehicleList> listVec = [];
  List<ListFilmGetResp> filList = [];
  List<Film> zz = [];
  RestApi api = new RestApi();
  String urlPlan = '';
  String urlChar = '';
  String urlSpes = '';
  String urlVec = '';
  String urlStar = '';
  String urlFilm = '';

  List<String> planet = [];
  FilmBloc() : super(FilmInitial()) {
    on<FilmEvent>((event, emit) async {
      try {
        emit(SetupFilmProgress());
        if (event is SetupFilmEvent) {
          result = await searchFilm();

          emit(SetupFilmComplete(result));
        }
        emit(SetupAllDetailFilmProgress());
        if (event is GetUrlPlanet) {
          urlPlan = event.url;
          pln1 = await getPlanetFromFilm(urlPlan);

          listplan.add(pln1);
          print(listplan);
          emit((GetUrlPlanetComplete(listplan)));
        } else if (event is GetUrlCharacter) {
          urlChar = event.url;
          char = await getCharacterFromFilm(urlChar);

          listchar.add(char);
          print(listchar);
          emit((GetUrlCharacterComplete(listchar)));
        } else if (event is GetUrlStarships) {
          urlStar = event.url;
          star = await getStarshipsFromFilm(urlStar);

          liststar.add(star);
          print(liststar);
          emit((GetUrlStarshipsComplete(liststar)));
        } else if (event is GetUrlVehicle) {
          urlVec = event.url;
          vec = await getVehicleFromFilm(urlVec);

          listVec.add(vec);
          print(listVec);
          emit((GetUrlVehicleComplete(listVec)));
        } else if (event is GetUrlSpesies) {
          urlSpes = event.url;
          spes = await getSpesiesFromFilm(urlSpes);

          listspes.add(spes);
          print(listspes);
          emit((GetUrlSpesiesComplete(listspes)));
        } else if (event is GetUrlFilm) {
          urlFilm = event.url;
          fil = await getListFilm(urlFilm);

          filList.add(fil);
          print(filList);
          emit((GetUrlFilmComplete(filList)));
        }
      } catch (e) {
        emit(FilmFailedShow(e.toString()));
      }
    });
  }

  searchFilm() async {
    FilmLists result1 = FilmLists();
    result1 = await api.getFilm();

    return result1;
  }

  getPlanetFromFilm(String url) async {
    PlanetList res12 = PlanetList();

    res12 = await api.getPlanetsList(url);

    return res12;
  }

  getCharacterFromFilm(String url) async {
    ChracterList res12 = ChracterList();

    res12 = await api.getCharacterList(url);

    return res12;
  }

  getStarshipsFromFilm(String url) async {
    StarshipsList res12 = StarshipsList();

    res12 = await api.getStarShipsList(url);

    return res12;
  }

  getVehicleFromFilm(String url) async {
    VehicleList res12 = VehicleList();

    res12 = await api.getVehicleList(url);

    return res12;
  }

  getSpesiesFromFilm(String url) async {
    SpesiesgetList res12 = SpesiesgetList();

    res12 = await api.getSpesiesList(url);

    return res12;
  }

  getListFilm(String url) async {
    ListFilmGetResp res12 = ListFilmGetResp();

    res12 = await api.getFilmList(url);

    return res12;
  }
}
