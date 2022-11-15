import 'package:Star_Wars/bloc/bloc/starWars_film_bloc.dart';
import 'package:Star_Wars/bloc/event/starWars_film_event.dart';
import 'package:Star_Wars/bloc/state/starWars_film_state.dart';
import 'package:Star_Wars/custom_widget/form_textfield.dart';
import 'package:Star_Wars/helper/extensions.dart';
import 'package:Star_Wars/helper/locator.dart';
import 'package:Star_Wars/helper/navigator_service.dart';
import 'package:Star_Wars/model/character_model/model_character.dart';
import 'package:Star_Wars/model/character_model/model_spesies.dart';
import 'package:Star_Wars/model/character_model/model_starships.dart';
import 'package:Star_Wars/model/character_model/model_vehicle.dart';
import 'package:Star_Wars/model/model_helper/helper_planet.dart';
import 'package:Star_Wars/model/new_model/film_model.dart';
import 'package:Star_Wars/model/planet_model/model_planet.dart';
import 'package:Star_Wars/ui/splash_success/splash_screen_starWars.dart';
import 'package:Star_Wars/ui/star_wars_ui/character_item.dart';
import 'package:Star_Wars/ui/star_wars_ui/planet_item.dart';
import 'package:Star_Wars/ui/star_wars_ui/spesies_item.dart';
import 'package:Star_Wars/ui/star_wars_ui/starships_item.dart';
import 'package:Star_Wars/ui/star_wars_ui/vehicle_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';


class DetailFilmUi extends StatefulWidget {
  final Film? dataUi;
  const DetailFilmUi({Key? key, this.dataUi}) : super(key: key);

  @override
  State<DetailFilmUi> createState() => _DetailFilmUiState();
}

class _DetailFilmUiState extends State<DetailFilmUi> {
  Film res = Film();

  List<PlanetList> listplan = [];
  List<ChracterList> listchar = [];
  List<SpesiesgetList> listspes = [];
  List<StarshipsList> liststar = [];
  List<VehicleList> listVec = [];

  List<Film> rest = [];
  List<Planet> pln = [];
  List<Character> car = [];
  List<Spesies> sps = [];
  List<StarShips> sts = [];
  List<Vehicle> vc = [];

  TextEditingController openC = TextEditingController();
  @override
  void initState() {
    openC.text = widget.dataUi!.openingCrawl!;
    res = widget.dataUi!;
    rest.add(res);
    if (rest.length > 0) {
      for (int i = 0; i < rest.length; i++) {
        var list = [];
        var list1 = [];
        var list2 = [];
        var list3 = [];
        var list4 = [];
        list.addAll(rest[i].planets!);
        list1.addAll(rest[i].characters!);
        list2.addAll(rest[i].starships!);
        list3.addAll(rest[i].vehicles!);
        list4.addAll(rest[i].species!);
        pln = list.map((list) => Planet(list)).toList();
        car = list1.map((list1) => Character(list1)).toList();
        sps = list4.map((list4) => Spesies(list4)).toList();
        sts = list2.map((list2) => StarShips(list2)).toList();
        vc = list3.map((list3) => Vehicle(list3)).toList();

        if (pln.length > 0) {
          for (int i = 0; i < pln.length; i++) {
            String url = pln[i].url;
            bloc(GetUrlPlanet(url));
          }
        } else {
          bloc(GetUrlPlanet(''));
        }
        if (vc.length > 0) {
          for (int i = 0; i < vc.length; i++) {
            String url = vc[i].url;
            bloc(GetUrlVehicle(url));
          }
        } else {
          bloc(GetUrlVehicle(''));
        }
        if (car.length > 0) {
          for (int i = 0; i < car.length; i++) {
            String url = car[i].url;
            bloc(GetUrlCharacter(url));
          }
        } else {
          bloc(GetUrlCharacter(''));
        }
        if (sps.length > 0) {
          for (int i = 0; i < sps.length; i++) {
            String url = sps[i].url;
            bloc(GetUrlSpesies(url));
          }
        } else {
          bloc(GetUrlSpesies(''));
        }
        if (sts.length > 0) {
          for (int i = 0; i < sts.length; i++) {
            String url = sts[i].url;
            bloc(GetUrlStarships(url));
          }
        } else {
          bloc(GetUrlStarships(''));
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
              if (state is GetUrlPlanetComplete) {
                setState(() {
                  listplan.clear();
                  listplan.addAll(state.url);
                });
              }
              if (state is GetUrlStarshipsComplete) {
                setState(() {
                  liststar.clear();
                  liststar.addAll(state.url);
                });
              }
              if (state is GetUrlCharacterComplete) {
                setState(() {
                  listchar.clear();
                  listchar.addAll(state.url);
                });
              }
              if (state is GetUrlVehicleComplete) {
                setState(() {
                  listVec.clear();
                  listVec.addAll(state.url);
                });
              }
              if (state is GetUrlSpesiesComplete) {
                setState(() {
                  listspes.clear();
                  listspes.addAll(state.url);
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
              backgroundColor: widget.dataUi!.title!.contains('Jedi')
                  ? Colors.green
                  : widget.dataUi!.title == 'A New Hope'
                      ? Colors.purple
                      : widget.dataUi!.title == 'The Empire Strikes Back'
                          ? Colors.indigoAccent
                          : widget.dataUi!.title == 'The Phantom Menace'
                              ? Colors.blue
                              : widget.dataUi!.title == 'Attack of the Clones'
                                  ? Colors.orange
                                  : widget.dataUi!.title ==
                                          'Revenge of the Sith'
                                      ? Colors.red
                                      : Colors.black,
              automaticallyImplyLeading: false,
              elevation: 0,
              title: freeTittle(),
            ),
            body: BlocBuilder<FilmBloc, FilmState>(
              builder: (context, state) {
                if (state is SetupAllDetailFilmProgress) {
                  return Container(
                    child: SplashStarWars(
                      color: widget.dataUi!.title!.contains('Jedi')
                          ? Colors.green
                          : widget.dataUi!.title == 'A New Hope'
                              ? Colors.purple
                              : widget.dataUi!.title ==
                                      'The Empire Strikes Back'
                                  ? Colors.indigoAccent
                                  : widget.dataUi!.title == 'The Phantom Menace'
                                      ? Colors.blue
                                      : widget.dataUi!.title ==
                                              'Attack of the Clones'
                                          ? Colors.orange
                                          : widget.dataUi!.title ==
                                                  'Revenge of the Sith'
                                              ? Colors.red
                                              : Colors.black,
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
                    color: widget.dataUi!.title!.contains('Jedi')
                        ? Colors.green
                        : widget.dataUi!.title == 'A New Hope'
                            ? Colors.purple
                            : widget.dataUi!.title == 'The Empire Strikes Back'
                                ? Colors.indigoAccent
                                : widget.dataUi!.title == 'The Phantom Menace'
                                    ? Colors.blue
                                    : widget.dataUi!.title ==
                                            'Attack of the Clones'
                                        ? Colors.orange
                                        : widget.dataUi!.title ==
                                                'Revenge of the Sith'
                                            ? Colors.red
                                            : Colors.black,

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
                                'A. Character in ${widget.dataUi!.title}',
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
                                'B. Planet in ${widget.dataUi!.title}',
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
                                              itemCount: listplan.length,
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
                              SizedBox(height: deviceHeight * 0.03),
                              Text(
                                'C. Vehicle in ${widget.dataUi!.title}',
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
                                              itemCount: listVec.length,
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
                                                      child: vehicleList(
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
                                'D. Starships in ${widget.dataUi!.title}',
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
                                              itemCount: liststar.length,
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
                                                      child: starList(
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
                                'E. Spesies in ${widget.dataUi!.title}',
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
                                              itemCount: listspes.length,
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
                                                      child: spesiesList(
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
          Text(widget.dataUi!.title!,
              style: TextStyle(fontSize: context.scaleFont(20))),
          Spacer(),
          GestureDetector(
              onTap: () {
                showOpenCrawlDialog(context);
              },
              child: Icon(Icons.list_alt))
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
    return (listplan.length != 0)
        ? BlocBuilder<FilmBloc, FilmState>(
            builder: (context, state) {
              return PlanetItem(
                  deviceHeight: MediaQuery.of(context).size.height,
                  deviceWidth: MediaQuery.of(context).size.width,
                  name: listplan[index].name!,
                  rotationPeriod: listplan[index].rotationPeriod!,
                  orbital: listplan[index].orbitalPeriod!,
                  diameter: listplan[index].diameter!,
                  gravity: listplan[index].gravity!,
                  image: listplan[index].name! == 'Yavin IV'
                      ? 'Assets/img/Yavin.png'
                      : listplan[index].name!.contains('Alderaan')
                          ? 'Assets/img/Alderaan.png'
                          : listplan[index].name! == 'Tatooine'
                              ? 'Assets/img/tatoine.png'
                              : 'Assets/img/earth.png');
            },
          )
        : Container();
  }

  Widget vehicleList(BuildContext context, int index) {
    return (listVec.length != 0)
        ? BlocBuilder<FilmBloc, FilmState>(
            builder: (context, state) {
              return VehicleItem(
                  deviceHeight: MediaQuery.of(context).size.height,
                  deviceWidth: MediaQuery.of(context).size.width,
                  name: listVec[index].name!,
                  model: listVec[index].model!,
                  manufacture: listVec[index].manufacturer!,
                  cost: listVec[index].costInCredits!,
                  length: listVec[index].length!,
                  image: listVec[index].name! == 'Sand Crawler'
                      ? 'Assets/img/Sandcrawler.png'
                      : listVec[index].name!.contains('T-16 skyhopper')
                          ? 'Assets/img/Skyhopper.png'
                          : listVec[index].name! == 'X-34 landspeeder'
                              ? 'Assets/img/Landspeeder.png'
                              : 'Assets/img/marquez.png');
            },
          )
        : Container();
  }

  Widget starList(BuildContext context, int index) {
    return (liststar.length != 0)
        ? BlocBuilder<FilmBloc, FilmState>(
            builder: (context, state) {
              return StarshpsItem(
                  deviceHeight: MediaQuery.of(context).size.height,
                  deviceWidth: MediaQuery.of(context).size.width,
                  name: liststar[index].name!,
                  model: liststar[index].model!,
                  manufacture: liststar[index].manufacturer!,
                  cost: liststar[index].costInCredits!,
                  length: liststar[index].length!,
                  image: liststar[index].name!.contains('Falcon')
                      ? 'Assets/img/Falcon.png'
                      : liststar[index].name!.contains('Imperial')
                          ? 'Assets/img/Imperial.png'
                          : liststar[index].name!.contains('Executor')
                              ? 'Assets/img/Executor.png'
                              : liststar[index].name!.contains('Rebel')
                                  ? 'Assets/img/RebelT.png'
                                  : liststar[index].name!.contains('Destroyer')
                                      ? 'Assets/img/Sdes.png'
                                      : 'Assets/img/ultraman.png');
            },
          )
        : Container();
  }

  Widget spesiesList(BuildContext context, int index) {
    return (listspes.length != 0)
        ? BlocBuilder<FilmBloc, FilmState>(
            builder: (context, state) {
              return SpesiesItem(
                  deviceHeight: MediaQuery.of(context).size.height,
                  deviceWidth: MediaQuery.of(context).size.width,
                  name: listspes[index].name!,
                  model: listspes[index].classification!,
                  manufacture: listspes[index].designation!,
                  cost: listspes[index].averageHeight!,
                  length: listspes[index].skinColors!,
                  image: listspes[index].name!.contains('Human')
                      ? 'Assets/img/human.png'
                      : listspes[index].name!.contains('Droid')
                          ? 'Assets/img/droid.png'
                          : listspes[index].name!.contains('Wookie')
                              ? 'Assets/img/wookie.png'
                              : listspes[index].name!.contains('Rodian')
                                  ? 'Assets/img/rodian.png'
                                  : listspes[index].name!.contains('Hutt')
                                      ? 'Assets/img/Hutt.png'
                                      : listspes[index].name!.contains("Yoda's")
                                          ? 'Assets/img/yoda.png'
                                          : 'Assets/img/darthvader.png');
            },
          )
        : Container();
  }

  showOpenCrawlDialog(BuildContext context) {
    // set up the button

    Widget cancelButton = TextButton(
      child: Text("Batal"),
      onPressed: () {
        locator<NavigatorService>().goBack();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("OpeningCrawl"),
      content: CustomFormTextField(
        controller: openC,
        label: '',
        readOnly: true,
        enabled: false,
        maxLength: 500,
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
      ),
      actions: [
        cancelButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
