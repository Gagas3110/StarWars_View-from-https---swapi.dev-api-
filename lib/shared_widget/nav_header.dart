import 'package:Star_Wars/helper/locator.dart';
import 'package:Star_Wars/helper/navigator_service.dart';
import 'package:Star_Wars/shared_widget/trustpost_logo.dart';
import 'package:Star_Wars/theme/colors.dart';
import 'package:flutter/material.dart';


AppBar navHeader(String titleAppBar, {List<Widget>? actions}) {
  return AppBar(
    title: Text(
      titleAppBar,
      style: TextStyle(color: Colors.white, fontSize: 19),
    ),
    leading: Builder(
        builder: (context) => IconButton(
              icon: Icon(
                Icons.menu,
                color: TrustPostWhite,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            )),
    backgroundColor: TrustPostPrimary,
    actions: actions,
  );
}

AppBar navHeaderPrimary(String titleAppBar, {List<Widget>? actions}) {
  return AppBar(
    title: Text(
      titleAppBar,
      style: TextStyle(fontWeight: FontWeight.bold, color: TrustPostPrimary),
    ),
    leading: Builder(
      builder: (context) => IconButton(
        icon: Icon(
          MyFlutterApp.menu_2_outline,
          color: TrustPostPrimary,
        ),
        onPressed: () => Scaffold.of(context).openDrawer(),
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      ),
    ),
    backgroundColor: TrustPostWhite,
    actions: actions ?? [],
  );
}

AppBar navHeaderCheckin(String titleAppBar, {List<Widget>? actions}) {
  return AppBar(
    title: Text(
      titleAppBar,
      style: TextStyle(fontWeight: FontWeight.bold, color: TrustPostPrimary),
    ),
    leading: Builder(
      builder: (context) => IconButton(
        icon: Icon(
          MyFlutterApp.menu_2_outline,
          color: TrustPostPrimary,
        ),
        onPressed: () => Scaffold.of(context).openDrawer(),
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      ),
    ),
    backgroundColor: TrustPostWhite,
    actions: <Widget>[
      IconButton(
          icon: Icon(Icons.map_outlined, color: TrustPostPrimary),
          onPressed: () => {}),
    ],
  );
}

AppBar navHeaderPrimaryStock(String titleAppBar, {List<Widget>? actions}) {
  return AppBar(
    title: Text(
      titleAppBar,
      style: TextStyle(fontWeight: FontWeight.bold, color: TrustPostPrimary),
    ),
    leading: Builder(
      builder: (context) => IconButton(
        icon: Icon(
          MyFlutterApp.menu_2_outline,
          color: TrustPostPrimary,
        ),
        onPressed: () => Scaffold.of(context).openDrawer(),
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      ),
    ),
    backgroundColor: TrustPostWhite,
    actions: actions ?? [],
  );
}

AppBar navHeaderTesting(String titleAppBar, {List<Widget>? actions}) {
  return AppBar(
    title: Text(
      titleAppBar,
      style: TextStyle(fontWeight: FontWeight.bold, color: TrustPostPrimary),
    ),
    leading: Builder(
      builder: (context) => IconButton(
        icon: Icon(
          //MyFlutterApp.menu_2_outline,
          Icons.people_alt,
          color: TrustPostPrimary,
        ),
        onPressed: () => Scaffold.of(context).openDrawer(),
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      ),
    ),
    backgroundColor: TrustPostWhite,
    actions: actions ?? [],
  );
}

AppBar navHeaderStock(String titleAppBar, {List<Widget>? actions}) {
  return AppBar(
    title: Text(
      titleAppBar,
      style: TextStyle(fontWeight: FontWeight.bold, color: TrustPostPrimary),
    ),
    leading: Builder(
      builder: (context) => IconButton(
        icon: Icon(
          //MyFlutterApp.menu_2_outline,
          Icons.devices_other_rounded,
          color: TrustPostPrimary,
        ),
        onPressed: () => Scaffold.of(context).openDrawer(),
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      ),
    ),
    backgroundColor: TrustPostWhite,
    actions: actions ?? [],
  );
}

AppBar simpleHeader(String titleAppBar, {void Function()? onBackPressed}) {
  return AppBar(
    title: Text(
      titleAppBar,
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
    ),
    leading: Builder(
        builder: (context) => IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed:
                  onBackPressed ?? () => locator<NavigatorService>().goBack(),
            )),
    backgroundColor: Colors.grey.shade500,
  );
}

AppBar jagoHeaderProd(String titleAppBar, {void Function()? onBackPressed}) {
  return AppBar(
    title: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(right: 140, left: 80, top: 30, bottom: 20),
          child: Text(
            titleAppBar,
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
        ),
      ],
    ),
    leading: Builder(
        builder: (context) => IconButton(
              icon: Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 30),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              onPressed:
                  onBackPressed ?? () => locator<NavigatorService>().goBack(),
            )),
    backgroundColor: OrangeJago,
  );
}

AppBar jagoHeaderProdminFont(String titleAppBar,
    {void Function()? onBackPressed}) {
  return AppBar(
    title: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(right: 40, left: 30, top: 30, bottom: 20),
          child: Text(
            titleAppBar,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    ),
    leading: Builder(
        builder: (context) => IconButton(
              icon: Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 30),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              onPressed:
                  onBackPressed ?? () => locator<NavigatorService>().goBack(),
            )),
    backgroundColor: OrangeJago,
  );
}

AppBar navHeaderTab(
    String titleAppBar, TabController controller, List<Widget> tabList) {
  return AppBar(
    title: Text(
      titleAppBar,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: TrustPostPrimary,
        fontSize: 19,
      ),
    ),
    leading: Builder(
        builder: (context) => IconButton(
              icon: Icon(
                MyFlutterApp.menu_2_outline,
                color: TrustPostPrimary,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            )),
    backgroundColor: TrustPostWhite,
    bottom: TabBar(
      controller: controller,
      tabs: tabList,
      labelPadding: EdgeInsets.symmetric(vertical: 12),
      labelColor: TrustPostPrimary,
      labelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: TrustPostPrimary,
      ),
      unselectedLabelColor: Colors.grey,
      indicatorColor: TrustPostPrimary,
    ),
  );
}

AppBar navHeaderSearch({List<Widget>? actions, Widget? searchBar}) {
  return AppBar(
    title: searchBar,
    leading: Builder(
        builder: (context) => IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            )),
    backgroundColor: Colors.lightBlue,
    actions: actions,
  );
}

AppBar newAppBar({Widget? actions, Widget? searchBar}) {
  return AppBar(
    title: searchBar,
    leading: Builder(
        builder: (context) => IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            )),
    backgroundColor: Colors.lightBlue,
    actions: [actions!],
  );
}
