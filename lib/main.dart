import 'package:Star_Wars/helper/locator.dart';
import 'package:Star_Wars/helper/navigator_service.dart';
import 'package:Star_Wars/route_generator/route_generator.dart';
import 'package:Star_Wars/ui/star_wars_ui/spesies_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jago Project',
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavigatorService>().navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme:
            GoogleFonts.anekDevanagariTextTheme(Theme.of(context).textTheme),
      ),
      home: SpesPage(),
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
    );
  }
}


