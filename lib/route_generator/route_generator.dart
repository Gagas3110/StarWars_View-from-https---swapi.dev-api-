import 'package:Star_Wars/bloc/bloc/starWars_film_bloc.dart';
import 'package:Star_Wars/helper/constant.dart';
import 'package:Star_Wars/model/new_model/film_model.dart';
import 'package:Star_Wars/model/new_model/spesies_model.dart';
import 'package:Star_Wars/shared_widget/nav_header.dart';
import 'package:Star_Wars/ui/star_wars_ui/spesies_detail_ui.dart';
import 'package:Star_Wars/ui/star_wars_ui/star_wars_film_detail_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings? settings) {
    switch (settings!.name) {
 

      case Constant.MENU_SPESIES_DETAIL:
        Results args = settings.arguments as Results;
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(providers: [
                  BlocProvider<FilmBloc>(
                    create: (context) => FilmBloc(),
                  ),
                ], child: DetailSpesiesUI(dataUi: args)));

      case Constant.MENU_FILM_DETAIL:
        Film args = settings.arguments as Film;
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(providers: [
                  BlocProvider<FilmBloc>(
                    create: (context) => FilmBloc(),
                  ),
                ], child: DetailFilmUi(dataUi: args)));

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: navHeader('Error'),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Ups, ada sesuatu yang salah. Coba lagi"),
            Container(
              margin: EdgeInsets.all(4),
            ),
            GestureDetector(onTap: () {}, child: Icon(Icons.replay))
          ],
        )),
      );
    });
  }
}
