import 'package:Star_Wars/bloc/bloc/starWars_film_bloc.dart';
import 'package:Star_Wars/bloc/event/starWars_film_event.dart';
import 'package:Star_Wars/bloc/state/starWars_film_state.dart';
import 'package:Star_Wars/helper/extensions.dart';
import 'package:Star_Wars/model/character_model/model_character.dart';
import 'package:Star_Wars/model/character_model/model_film.dart';
import 'package:Star_Wars/model/model_helper/helper_planet.dart';
import 'package:Star_Wars/model/new_model/spesies_model.dart';
import 'package:Star_Wars/ui/splash_success/splash_screen_starWars.dart';
import 'package:Star_Wars/ui/star_wars_ui/character_item.dart';
import 'package:Star_Wars/ui/star_wars_ui/film_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';


class DetailSpesiesUI extends StatefulWidget {
  final Results? dataUi;
  const DetailSpesiesUI({Key? key, this.dataUi}) : super(key: key);

  @override
  State<DetailSpesiesUI> createState() => _DetailSpesiesUiState();
}

class _DetailSpesiesUiState extends State<DetailSpesiesUI> {
  Results res = Results();

  List<ChracterList> listchar = [];

  List<ListFilmGetResp> listFilm = [];

  List<Results> rest = [];

  List<Character> car = [];

  List<FilmList> fl = [];

  TextEditingController openC = TextEditingController();
  @override
  void initState() {
    res = widget.dataUi!;
    rest.add(res);
    if (rest.length > 0) {
      for (int i = 0; i < rest.length; i++) {
        var list1 = [];
        var list2 = [];

        list1.addAll(rest[i].people!);
        list2.addAll(rest[i].films!);

        car = list1.map((list1) => Character(list1)).toList();

        fl = list2.map((list2) => FilmList(list2)).toList();

        if (car.length > 0) {
          for (int i = 0; i < car.length; i++) {
            String url = car[i].url;
            bloc(GetUrlCharacter(url));
          }
        } else {
          bloc(GetUrlCharacter(''));
        }
        if (fl.length > 0) {
          for (int i = 0; i < fl.length; i++) {
            String url = fl[i].url;
            bloc(GetUrlFilm(url));
          }
        } else {
          bloc(GetUrlFilm(''));
        }
      }
    }

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bloc(dynamic event) {
    BlocProvider.of<FilmBloc>(context).add(event);
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return MultiBlocListener(
        listeners: [
          BlocListener<FilmBloc, FilmState>(
            listener: (context, state) async {
              if (state is GetUrlCharacterComplete) {
                setState(() {
                  listchar.clear();
                  listchar.addAll(state.url);
                });
              }

              if (state is GetUrlFilmComplete) {
                setState(() {
                  listFilm.clear();
                  listFilm.addAll(state.url);
                });
              }

              if (state is FilmFailedShow) {
                context.failSnackbar(state.msg);
              }
            },
          )
        ],
        child: Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.black,
              automaticallyImplyLeading: false,
              elevation: 0,
              title: freeTittle(),
            ),
            body: BlocBuilder<FilmBloc, FilmState>(
              builder: (context, state) {
                if (state is SetupAllDetailFilmProgress) {
                  return Container(
                    child: SplashStarWars(
                      color: Colors.black,
                    ),
                  );
                } else {
                  return Container(
                    padding: EdgeInsets.only(
                        top: deviceHeight * 0.02,
                        left: deviceWidth * 0.06,
                        right: deviceWidth * 0.06),
                    height: deviceHeight,
                    width: deviceWidth,
                    color: Colors.grey.shade300,

                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'A. Character with spesies ${widget.dataUi!.name}',
                                style: TextStyle(
                                    fontSize: context.scaleFont(14),
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                height: deviceHeight * 0.54,
                                width: deviceWidth,
                                child: SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Container(
                                        child: AnimationLimiter(
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              physics: BouncingScrollPhysics(),
                                              itemCount: listchar.length,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) {
                                                return AnimationConfiguration
                                                    .staggeredList(
                                                  position: index,
                                                  duration: const Duration(
                                                      milliseconds: 375),
                                                  child: SlideAnimation(
                                                    horizontalOffset: 50.0,
                                                    child: FadeInAnimation(
                                                      child: shinee(
                                                        context,
                                                        index,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: deviceHeight * 0.03),
                              Text(
                                "B. The film that this ${widget.dataUi!.name}' stars in",
                                style: TextStyle(
                                    fontSize: context.scaleFont(14),
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                height: deviceHeight * 0.54,
                                width: deviceWidth,
                                child: SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Container(
                                        child: AnimationLimiter(
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              physics: BouncingScrollPhysics(),
                                              itemCount: listFilm.length,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) {
                                                return AnimationConfiguration
                                                    .staggeredList(
                                                  position: index,
                                                  duration: const Duration(
                                                      milliseconds: 375),
                                                  child: SlideAnimation(
                                                    horizontalOffset: 50.0,
                                                    child: FadeInAnimation(
                                                      child: planetList(
                                                        context,
                                                        index,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //),
                  );
                }
              },
            )));
  }

  freeTittle() {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
          left: deviceWidth * 0.023, right: deviceWidth * 0.023),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios)),
          Spacer(),
          Text(widget.dataUi!.name!,
              style: TextStyle(fontSize: context.scaleFont(20))),
          Spacer(),
        ],
      ),
    );
  }

  Widget shinee(BuildContext context, int index) {
    return (listchar.length != 0)
        ? BlocBuilder<FilmBloc, FilmState>(
            builder: (context, state) {
              return CharItem(
                  deviceHeight: MediaQuery.of(context).size.height,
                  deviceWidth: MediaQuery.of(context).size.width,
                  name: listchar[index].name!,
                  birthYear: listchar[index].birthYear!,
                  gender: listchar[index].gender!,
                  height: listchar[index].height!,
                  mass: listchar[index].mass!,
                  image: listchar[index].name! == 'Yoda'
                      ? 'Assets/img/yoda.png'
                      : listchar[index].name! == 'Jek Tono Porkins'
                          ? 'Assets/img/jektono.png'
                          : listchar[index].name! == 'Obi-Wan Kenobi'
                              ? 'Assets/img/obi.png'
                              : listchar[index].name! == 'R5-D4'
                                  ? 'Assets/img/R5D4.png'
                                  : listchar[index].name! == 'Darth Vader'
                                      ? 'Assets/img/darthvader.png'
                                      : 'Assets/img/setarwars.png');
            },
          )
        : Container();
  }

  Widget planetList(BuildContext context, int index) {
    return (listFilm.length != 0)
        ? BlocBuilder<FilmBloc, FilmState>(
            builder: (context, state) {
              return FilmItems(
                  deviceHeight: MediaQuery.of(context).size.height,
                  deviceWidth: MediaQuery.of(context).size.width,
                  name: listFilm[index].title!,
                  rotationPeriod: listFilm[index].director!,
                  orbital: listFilm[index].producer!,
                  diameter: listFilm[index].releaseDate!,
                  gravity: '',
                  image: listFilm[index].title == 'A New Hope'
                      ? 'Assets/img/newHope.png'
                      : listFilm[index].title == 'The Empire Strikes Back'
                          ? 'Assets/img/emPireS.png'
                          : listFilm[index].title == 'Return of the Jedi'
                              ? 'Assets/img/Jedi.png'
                              : listFilm[index].title == 'The Phantom Menace'
                                  ? 'Assets/img/menace.png'
                                  : listFilm[index].title ==
                                          'Attack of the Clones'
                                      ? 'Assets/img/theClones.png'
                                      : listFilm[index].title ==
                                              'Revenge of the Sith'
                                          ? 'Assets/img/sith.png'
                                          : '');
            },
          )
        : Container();
  }
}
