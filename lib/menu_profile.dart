import 'package:calculator/calculator_screen.dart';
import 'package:calculator/menu.dart';
import 'package:flutter/material.dart';

class MenuProfile extends StatefulWidget {
  const MenuProfile({Key? key}) : super(key: key);

  @override
  _MenuProfileState createState() => _MenuProfileState();
}

class _MenuProfileState extends State<MenuProfile>
    with SingleTickerProviderStateMixin {




  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Stack(
        children: [
          MenuPage(),
          homeCal(),

        ],
      ),
    );
  }
}
