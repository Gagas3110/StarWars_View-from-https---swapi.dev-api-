import 'package:Star_Wars/shared_widget/drawer_menu_tile.dart';
import 'package:Star_Wars/ui/star_wars_ui/spesies_ui.dart';
import 'package:Star_Wars/ui/star_wars_ui/star_wars_ui.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return NavDrawerBody();
  }
}

class NavDrawerBody extends StatefulWidget {
  @override
  _NavDrawerBodyState createState() => _NavDrawerBodyState();
}

class _NavDrawerBodyState extends State<NavDrawerBody> {
  var iconRegVA = Icon(null);
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25),
      width: MediaQuery.of(context).size.width * 0.62,
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: Image.asset('Assets/img/stw.png'),
                  ),
                ),
                SizedBox(height: 20),
                Divider(),
                DrawerTile(
                    icon: Icons.list,
                    title: 'Spesies',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SpesPage(),
                          ));
                    }),
                Divider(),
                DrawerTile(
                    icon: Icons.tv,
                    title: 'Film',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WarsPage(),
                          ));
                    }),
                Divider(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
                DrawerTile(title: 'Create by : Gagas W N', onTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
