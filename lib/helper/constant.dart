import 'package:flutter/material.dart';

class Constant extends InheritedWidget {
  static Constant? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<Constant>();

  const Constant({required Widget child, Key? key})
      : super(key: key, child: child);

static const String MENU_LOGIN = "MENU_LOGIN";
static const String MENU_FILM_DETAIL = "MENU_FILM_DETAIL";
static const String MENU_SPESIES_DETAIL = "MENU_SPESIES_DETAIL";
  @override
  bool updateShouldNotify(Constant oldWidget) => false;
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

class ApiConstants{


}

class SharedKey{
  
}
