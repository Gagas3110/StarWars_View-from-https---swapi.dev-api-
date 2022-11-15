import 'package:Star_Wars/model/character_model/model_character.dart';
import 'package:Star_Wars/model/character_model/model_film.dart';
import 'package:Star_Wars/model/character_model/model_spesies.dart';
import 'package:Star_Wars/model/character_model/model_starships.dart';
import 'package:Star_Wars/model/character_model/model_vehicle.dart';
import 'package:Star_Wars/model/new_model/film_model.dart';
import 'package:Star_Wars/model/new_model/spesies_model.dart';
import 'package:Star_Wars/model/planet_model/model_planet.dart';
import 'package:Star_Wars/service/api_url.dart';
import 'package:Star_Wars/service/net_util.dart';
import 'package:dio/dio.dart';


class RestApi extends ApiUrl {
  NetworkUtil util = new NetworkUtil();

  Future<StarWars> getSpesies() {
    return util.gets(sUrl + '/species', headers: {
      'Content-Type': 'application/json',
      'Vary': 'Accept, Cookie',
      'Allow': 'GET, HEAD, OPTIONS'
    }, param: {}).then(
      (dynamic res) {
        print(res);
        if (res["errMsg"] != null) throw (res["errMsg"].toString());
        return StarWars.fromJson(res);
      },
    );
  }

  Future<dynamic> getNSpes(int page) {
    String nextPage = "https://swapi.dev/api/species/?page=$page";
    return util.getf(nextPage, headers: {
      'Content-Type': 'application/json',
      'Vary': 'Accept, Cookie',
      'Allow': 'GET, HEAD, OPTIONS'
    }, param: {}).then(
      (dynamic res) {
        print(res);
        if (res["errMsg"] != null) throw (res["errMsg"].toString());
        return res;
      },
    );
  }

  Future<dynamic> getSpesiesTestNext(int page) {
    return util.getz(urNextP + '?page=$page').then(
      (dynamic res) {
        return res;
      },
    );
  }

  getSpesiesNextPage(int page) async {
    String nextPage = "https://swapi.dev/api/species/?page=$page";
    var dio = Dio();
    final response = await dio.get(nextPage);
    List test = [];
    nextPage = response.data['next'];
    for (int i = 0; i < response.data['results'].length; i++) {
      test.add(response.data['results'][i]);
    }
    return test;
  }

  Future<FilmLists> getFilm() {
    return util.gets(sUrl + '/films/', headers: {
      'Content-Type': 'application/json',
      'Vary': 'Accept, Cookie',
      'Allow': 'GET, HEAD, OPTIONS'
    }, param: {}).then(
      (dynamic res) {
        print(res);

        if (res["errMsg"] != null) throw (res["errMsg"].toString());
        return FilmLists.fromJson(res);
      },
    );
  }

  Future<PlanetList> getPlanetsList(String url) {
    return util.gets(url, headers: {
      'Content-Type': 'application/json',
      'Vary': 'Accept, Cookie',
      'Allow': 'GET, HEAD, OPTIONS'
    }, param: {}).then(
      (dynamic res) {
        print(res);

        if (res["errMsg"] != null) throw (res["errMsg"].toString());
        return PlanetList.fromJson(res);
      },
    );
  }

  Future<ChracterList> getCharacterList(String url) {
    return util.gets(url, headers: {
      'Content-Type': 'application/json',
      'Vary': 'Accept, Cookie',
      'Allow': 'GET, HEAD, OPTIONS'
    }, param: {}).then(
      (dynamic res) {
        print(res);

        if (res["errMsg"] != null) throw (res["errMsg"].toString());
        return ChracterList.fromJson(res);
      },
    );
  }

  Future<StarshipsList> getStarShipsList(String url) {
    return util.gets(url, headers: {
      'Content-Type': 'application/json',
      'Vary': 'Accept, Cookie',
      'Allow': 'GET, HEAD, OPTIONS'
    }, param: {}).then(
      (dynamic res) {
        print(res);

        if (res["errMsg"] != null) throw (res["errMsg"].toString());
        return StarshipsList.fromJson(res);
      },
    );
  }

  Future<VehicleList> getVehicleList(String url) {
    return util.gets(url, headers: {
      'Content-Type': 'application/json',
      'Vary': 'Accept, Cookie',
      'Allow': 'GET, HEAD, OPTIONS'
    }, param: {}).then(
      (dynamic res) {
        print(res);

        if (res["errMsg"] != null) throw (res["errMsg"].toString());
        return VehicleList.fromJson(res);
      },
    );
  }

  Future<SpesiesgetList> getSpesiesList(String url) {
    return util.gets(url, headers: {
      'Content-Type': 'application/json',
      'Vary': 'Accept, Cookie',
      'Allow': 'GET, HEAD, OPTIONS'
    }, param: {}).then(
      (dynamic res) {
        print(res);

        if (res["errMsg"] != null) throw (res["errMsg"].toString());
        return SpesiesgetList.fromJson(res);
      },
    );
  }

  Future<ListFilmGetResp> getFilmList(String url) {
    return util.gets(url, headers: {
      'Content-Type': 'application/json',
      'Vary': 'Accept, Cookie',
      'Allow': 'GET, HEAD, OPTIONS'
    }, param: {}).then(
      (dynamic res) {
        print(res);

        if (res["errMsg"] != null) throw (res["errMsg"].toString());
        return ListFilmGetResp.fromJson(res);
      },
    );
  }
}
