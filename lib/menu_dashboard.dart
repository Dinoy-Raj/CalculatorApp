import 'package:flutter/material.dart';

class MenuBar extends StatefulWidget {
  const MenuBar({Key? key}) : super(key: key);

  @override
  _MenuBarState createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        menu(context),
      //Deashboard
      ],
    );
  }
  Widget menu(context)
  {
    return Column(
      children: [
        Text("Calculator"),
        Text("History"),
        Text("About Us"),
        Text("Analysis"),
      ],
    );
  }
}
