import 'package:Star_Wars/helper/extensions.dart';
import 'package:flutter/material.dart';



class DrawerTile extends StatelessWidget {
  final IconData? icon;
  final void Function()? onTap;
  final String? title;
  const DrawerTile({
    Key? key,
    this.icon,
    this.onTap,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title!,
        style: TextStyle(
          fontWeight: FontWeight.w100,
          color: Colors.black,
          fontSize: context.scaleFont(14),
        ),
      ),
      leading: Icon(
        icon,
        color: Colors.black,
        size: context.scaleFont(22),
      ),
      onTap: onTap,
    );
  }
}

class ExpansionDrawer extends StatelessWidget {
  final List<Widget>? children;
  final String? title;
  final IconData? icon;
  const ExpansionDrawer({
    Key? key,
    this.children,
    this.title,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Icon(
        icon,
        color: Colors.black,
        size: context.scaleFont(22),
      ),
      title: Text(
        title!,
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w100,
            fontSize: context.scaleFont(14)),
      ),
      children: children!,
    );
  }
}

class ExpansionNoLeading extends StatelessWidget {
  final List<Widget>? children;
  final String? title;
  final IconData? icon;
  const ExpansionNoLeading({
    Key? key,
    this.children,
    this.title,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        title!,
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w100,
            fontSize: context.scaleFont(14)),
      ),
      // trailing: IconButton(
      //   icon: Icon(Icons.add),
      //   onPressed: () => print('asdadasdadsadsas'),
      // ),
      children: children!,
    );
  }
}
