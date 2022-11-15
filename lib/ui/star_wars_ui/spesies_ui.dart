import 'dart:async';
import 'package:Star_Wars/bloc/bloc/spesies_bloc.dart';
import 'package:Star_Wars/bloc/event/spesies_event.dart';
import 'package:Star_Wars/bloc/state/spesies_state.dart';
import 'package:Star_Wars/helper/constant.dart';
import 'package:Star_Wars/helper/extensions.dart';
import 'package:Star_Wars/helper/locator.dart';
import 'package:Star_Wars/helper/nav_drawer.dart';
import 'package:Star_Wars/helper/navigator_service.dart';
import 'package:Star_Wars/model/new_model/spesies_model.dart';
import 'package:Star_Wars/shimmer_widget/search_texfield.dart';
import 'package:Star_Wars/ui/star_wars_ui/spesies_home_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SpesPage extends StatefulWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const SpesPage({Key? key, this.scaffoldKey}) : super(key: key);
  @override
  _SpesPageState createState() => _SpesPageState();
}

class _SpesPageState extends State<SpesPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SpesiesBloc>(
          create: (context) => SpesiesBloc(),
        ),
      ],
      child: SpesiesScreen(key: widget.scaffoldKey),
    );
  }
}

class SpesiesScreen extends StatefulWidget {
  const SpesiesScreen({Key? key}) : super(key: key);

  @override
  State<SpesiesScreen> createState() => _SpesiesScreenState();
}

class _SpesiesScreenState extends State<SpesiesScreen> {
  double? deviceHeight;
  double? deviceWidth;
  Timer? searchOnStoppedTyping;
  String? url;
  ScrollController scrollController = new ScrollController();
  TextEditingController searchCo = TextEditingController();
  bool isLoading = false;
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  List names = [];
  List<Results> res = [];
  List<Results> matches = [];
  StarWars result1 = StarWars();
  int paging = 1;
  @override
  void initState() {
    matches = res;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.addListener(scrollListener);
      bloc(SetupSpesiesEvent());
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bloc(dynamic event) {
    BlocProvider.of<SpesiesBloc>(context).add(event);
  }

  scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      bloc(SpesiesLoadMore(paging));
    }
  }

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;

    return MultiBlocListener(
      listeners: [
        BlocListener<SpesiesBloc, SpesiesState>(
          listener: (context, state) async {
            if (state is SetupSpesiesComplete) {
              setState(() {
                res.clear();
                res = state.res.results!;
                matches = state.res.results!;
                result1 = state.res;
                url = state.res.next;
                paging = 2;
              });
            }
            if (state is SpesiesLoadMoreComplete) {
              setState(() {
                matches.addAll(state.res.results!);
                paging++;
                print(matches.length);
              });
            }
            if (state is SpesiesFailedShow) {
              context.failSnackbar(state.msg.contains('404')
                  ? 'Error : Forbidden Request'
                  : state.msg.contains(
                          "DioError [DioErrorType.response]: Http status error [404]")
                      ? "OOPPSS, look like u have reached limit the page(total data = ${matches.length})"
                      : state.msg.contains(
                              "CERTIFICATE_VERIFY_FAILED: certificate has expired")
                          ? "Error : Expired API at 15/11/2022"
                          : "Error Undefined");
            }
          },
        )
      ],
      child: Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: freeTittle(),
        ),
        key: scaffoldKey,
        body: BlocBuilder<SpesiesBloc, SpesiesState>(builder: (context, state) {
          if (state is SetupSpesiesProgress) {
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
                controller: scrollController,
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi Gagas, looking for spesies in StarWars?',
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
                          hint: 'Search Spesies',
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
                                  key: ValueKey(matches[index].name),
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
        ? BlocBuilder<SpesiesBloc, SpesiesState>(
            builder: (context, state) {
              return SpesItem(
                  name: matches[index].name,
                  averageHeight: matches[index].averageHeight,
                  averageLife: matches[index].averageLifespan,
                  deviceHeight: MediaQuery.of(context).size.height,
                  deviceWidth: MediaQuery.of(context).size.width,
                  classification: matches[index].classification,
                  designation: matches[index].designation,
                  res: matches[index],
                  image: matches[index].name!.contains('Human')
                      ? 'Assets/img/human.png'
                      : matches[index].name!.contains('Droid')
                          ? 'Assets/img/droid.png'
                          : matches[index].name!.contains('Wookie')
                              ? 'Assets/img/wookie.png'
                              : matches[index].name!.contains('Rodian')
                                  ? 'Assets/img/rodian.png'
                                  : matches[index].name!.contains('Hutt')
                                      ? 'Assets/img/Hutt.png'
                                      : matches[index].name!.contains("Yoda's")
                                          ? 'Assets/img/yoda.png'
                                          : matches[index]
                                                  .name!
                                                  .contains("Trandoshan")
                                              ? 'Assets/img/trandoshian.png'
                                              : matches[index]
                                                      .name!
                                                      .contains("Mon Calamari")
                                                  ? 'Assets/img/Calmari.png'
                                                  : matches[index]
                                                          .name!
                                                          .contains("Ewok")
                                                      ? 'Assets/img/Ewok.png'
                                                      : matches[index]
                                                              .name!
                                                              .contains(
                                                                  "Sullustan")
                                                          ? 'Assets/img/Sullustans.png'
                                                          : matches[index]
                                                                  .name!
                                                                  .contains(
                                                                      "Neimodian")
                                                              ? 'Assets/img/Neimodian.png'
                                                              : matches[index]
                                                                      .name!
                                                                      .contains(
                                                                          "Cerean")
                                                                  ? 'Assets/img/Cerean.png'
                                                                  : matches[index]
                                                                          .name!
                                                                          .contains(
                                                                              "Toong")
                                                                      ? 'Assets/img/Toong.png'
                                                                      : matches[index]
                                                                              .name!
                                                                              .contains("Xexto")
                                                                          ? 'Assets/img/Xexto.png'
                                                                          : matches[index].name!.contains("Vulptereen")
                                                                              ? 'Assets/img/Vulptereen.png'
                                                                              : matches[index].name!.contains("Aleena")
                                                                                  ? 'Assets/img/Aleena.png'
                                                                                  : matches[index].name!.contains("Twi'lek")
                                                                                      ? "Assets/img/Twi'lek.png"
                                                                                      : matches[index].name!.contains("Dug")
                                                                                          ? 'Assets/img/Dug.png'
                                                                                          : matches[index].name!.contains("Toydarian")
                                                                                              ? 'Assets/img/Toydarian.png'
                                                                                              : matches[index].name!.contains("Gungan")
                                                                                                  ? 'Assets/img/Gungan.png'
                                                                                                  : matches[index].name!.contains("Nautolan")
                                                                                                      ? 'Assets/img/Nautolan.png'
                                                                                                      : matches[index].name!.contains("Tholothian")
                                                                                                          ? 'Assets/img/Tholothian.png'
                                                                                                          : matches[index].name!.contains("iktotchi")
                                                                                                              ? 'Assets/img/iktotchi.png'
                                                                                                              : matches[index].name!.contains("Quermian")
                                                                                                                  ? 'Assets/img/Quermian.png'
                                                                                                                  : matches[index].name!.contains("Kel Dor")
                                                                                                                      ? 'Assets/img/Kel Dor.png'
                                                                                                                      : matches[index].name!.contains("Chagrian")
                                                                                                                          ? 'Assets/img/Chagrian.png'
                                                                                                                          : matches[index].name!.contains("Geonosian")
                                                                                                                              ? 'Assets/img/Geonosian.png'
                                                                                                                              : matches[index].name!.contains("Mirialan")
                                                                                                                                  ? 'Assets/img/Mirialan.png'
                                                                                                                                  : matches[index].name!.contains("Clawdite")
                                                                                                                                      ? 'Assets/img/Clawdite.png'
                                                                                                                                      : matches[index].name!.contains("Besalisk")
                                                                                                                                          ? 'Assets/img/Besalisk.png'
                                                                                                                                          : matches[index].name!.contains("Zabrak")
                                                                                                                                              ? 'Assets/img/Zabrak.png'
                                                                                                                                              : matches[index].name!.contains("Kaminoan")
                                                                                                                                                  ? 'Assets/img/Kaminoan.png'
                                                                                                                                                  : matches[index].name!.contains("Skakoan")
                                                                                                                                                      ? 'Assets/img/Skakoan.png'
                                                                                                                                                      : matches[index].name!.contains("Muun")
                                                                                                                                                          ? 'Assets/img/Muun.png'
                                                                                                                                                          : matches[index].name!.contains("Togruta")
                                                                                                                                                              ? 'Assets/img/Togruta.png'
                                                                                                                                                              : matches[index].name!.contains("Kaleesh")
                                                                                                                                                                  ? 'Assets/img/Kaleesh.png'
                                                                                                                                                                  : matches[index].name!.contains("Pau'an")
                                                                                                                                                                      ? "Assets/img/Pau'an.png"
                                                                                                                                                                      : 'Assets/img/darthvader.png');
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
          Text('Spesies Page'),
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
    List<Results> allFilm = [];

    if (search == '' && search.isEmpty) {
      allFilm = res;
    } else {
      allFilm = res
          .where(
              (film) => film.name!.toLowerCase().contains(search.toLowerCase()))
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
