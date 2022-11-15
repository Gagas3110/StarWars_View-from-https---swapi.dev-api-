import 'dart:async';

import 'package:Star_Wars/bloc/bloc/starWars_film_bloc.dart';
import 'package:Star_Wars/bloc/event/starWars_film_event.dart';
import 'package:Star_Wars/bloc/state/starWars_film_state.dart';
import 'package:Star_Wars/helper/constant.dart';
import 'package:Star_Wars/helper/extensions.dart';
import 'package:Star_Wars/helper/locator.dart';
import 'package:Star_Wars/helper/nav_drawer.dart';
import 'package:Star_Wars/helper/navigator_service.dart';
import 'package:Star_Wars/model/new_model/film_model.dart';
import 'package:Star_Wars/shimmer_widget/search_texfield.dart';
import 'package:Star_Wars/ui/star_wars_ui/star_wars_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';


class WarsPage extends StatefulWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const WarsPage({Key? key, this.scaffoldKey}) : super(key: key);
  @override
  _WarsPageState createState() => _WarsPageState();
}

class _WarsPageState extends State<WarsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FilmBloc>(
          create: (context) => FilmBloc(),
        ),
      ],
      child: StarWarsScreen(key: widget.scaffoldKey),
    );
  }
}

class StarWarsScreen extends StatefulWidget {
  const StarWarsScreen({Key? key}) : super(key: key);

  @override
  State<StarWarsScreen> createState() => _StarWarsScreenState();
}

class _StarWarsScreenState extends State<StarWarsScreen> {
  double? deviceHeight;
  double? deviceWidth;
  Timer? searchOnStoppedTyping;
  TextEditingController searchCo = TextEditingController();

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  List<Film> res = [];
  List<Film> matches = [];
  @override
  void initState() {
    matches = res;
    bloc(SetupFilmEvent());
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
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;

    return MultiBlocListener(
      listeners: [
        BlocListener<FilmBloc, FilmState>(
          listener: (context, state) async {
            if (state is SetupFilmComplete) {
              setState(() {
                res.clear();
                res = state.res.results!;
                matches = state.res.results!;
              });
            }
            if (state is FilmFailedShow) {
              context.failSnackbar(state.msg);
            }
          },
        )
      ],
      child: Scaffold(
        drawer: NavDrawer(),
        appBar:
           
            AppBar(
          backgroundColor: Colors.black,
          
          elevation: 0,
          title: freeTittle(),
        ),
        key: scaffoldKey,
        body: BlocBuilder<FilmBloc, FilmState>(builder: (context, state) {
          if (state is SetupFilmProgress) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimationLimiter(
                    child: Center(
                  child: CircularProgressIndicator(),
                )),
              ],
            );
          } else {
            return Container(
              height: deviceHeight,
              width: deviceWidth,
              color: Colors.white,
              padding: EdgeInsets.only(
                  top: deviceHeight! * 0.02,
                  left: deviceWidth! * 0.06,
                  right: deviceWidth! * 0.06),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi Gagas, looking for StarWars Film?',
                        style: TextStyle(
                            fontSize: context.scaleFont(15),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: deviceHeight! * 0.03),
                      Container(
                        height: deviceHeight! * 0.07,
                        width: deviceWidth,
                        child: SearchTextField(
                          controller: searchCo,
                          hint: 'Search Film',
                          suffix: Icons.search,
                          onChanged: (value) {
                            setState(() async {
                              await onChangeHandler(value);
                            });
                          },
                          inputType: null,
                        ),
                      ),
                      SizedBox(height: deviceHeight! * 0.03),
                      Container(
                        child: AnimationLimiter(
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemCount: matches.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  key: ValueKey(matches[index].title),
                                  duration: const Duration(milliseconds: 375),
                                  child: SlideAnimation(
                                    verticalOffset: 50.0,
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
                    ]),
              ),
            );
          }
        }),
      ),
    );
  }

  Widget shinee(BuildContext context, int index) {
    return (matches.length != 0)
        ? BlocBuilder<FilmBloc, FilmState>(
            builder: (context, state) {
              return FilmItem(
                  title: matches[index].title,
                  releaseDate: matches[index].releaseDate,
                  director: matches[index].director,
                  deviceHeight: MediaQuery.of(context).size.height,
                  deviceWidth: MediaQuery.of(context).size.width,
                  producer: matches[index].producer,
                  res: matches[index],
                  openingCrawl: matches[index].oPc,
                  image: matches[index].title == 'A New Hope'
                      ? 'Assets/img/newHope.png'
                      : matches[index].title == 'The Empire Strikes Back'
                          ? 'Assets/img/emPireS.png'
                          : matches[index].title == 'Return of the Jedi'
                              ? 'Assets/img/Jedi.png'
                              : matches[index].title == 'The Phantom Menace'
                                  ? 'Assets/img/menace.png'
                                  : matches[index].title ==
                                          'Attack of the Clones'
                                      ? 'Assets/img/theClones.png'
                                      : matches[index].title ==
                                              'Revenge of the Sith'
                                          ? 'Assets/img/sith.png'
                                          : '');
            },
          )
        : Container();
  }

  freeTittle() {
    return Padding(
      padding: EdgeInsets.only(
          left: deviceWidth! * 0.023, right: deviceWidth! * 0.023),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Text('StarWars'),
          Spacer(),
          CircleAvatar(
            maxRadius: deviceHeight! * 0.025,
            minRadius: deviceHeight! * 0.01,
            backgroundImage: AssetImage('Assets/img/30022-paquito.png'),
          )
        ],
      ),
    );
  }

  searchBook(String search) async {
    List<Film> allFilm = [];

    if (search == '' && search.isEmpty) {
      allFilm = res;
    } else {
      allFilm = res
          .where((film) =>
              film.title!.toLowerCase().contains(search.toLowerCase()))
          .toList();
    }

    setState(() {
      matches = allFilm;
    });
  }

  onChangeHandler(String value) async {
    const duration = Duration(milliseconds: 800);
    if (searchOnStoppedTyping != null) {
      setState(() => searchOnStoppedTyping!.cancel());
    }
    setState(() =>
        searchOnStoppedTyping = new Timer(duration, () => searchBook(value)));
  }

  void handleClick2(int index) {
    locator<NavigatorService>()
        .navigateToWithArgmnt(Constant.MENU_FILM_DETAIL, res[index]);
  }
}
