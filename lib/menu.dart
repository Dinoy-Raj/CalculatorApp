import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
// import 'package:calculator/calculator_screen.dart';

import 'google_sign_in.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  final user = FirebaseAuth.instance.currentUser;
  Color whiteC = Colors.white;
  Color blackC = Colors.black;
  Color swap=Colors.white;
  double gap = 20.0;
  double fontSize = 15;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 350,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(user!.photoURL!),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              user!.displayName!,
                              style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: 15,),
                  // Text('Email : '+ user.email! ,style: TextStyle(
                  //   //fontWeight: FontWeight.bold,
                  //   fontSize: 15,
                  //   color: Colors.black,
                  // ),),
                  SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 110,
                      height: 455,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [


                            SizedBox(
                              height: gap,
                            ),
                            Text(
                              "History",
                              style: TextStyle(
                                fontSize: fontSize,
                                color: whiteC,
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
                            Divider(),

                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: 800,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          child: IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context, builder: (_) => logOut());
                            },
                            icon: Icon(Icons.exit_to_app),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Log Out ",
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );


  }

  Widget logOut() {
    return AlertDialog(
      title: Text(
        "Log Out From " + user!.displayName!,
        style: TextStyle(
          //fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Container(
        height: 180,
        width: 100,
        child: Column(
          children: [
            //Text("Are You Sure ?"),
            Container(
              height: 180,
                width: 200,
                child: Lottie.network(
                    "https://assets2.lottiefiles.com/packages/lf20_ukmmbtae.json")),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.LogOut();
            Navigator.pop(context);
          },
          child: Text(
            "Yes",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(6),
              backgroundColor: MaterialStateProperty.all(Colors.black),
            overlayColor: MaterialStateProperty.all(Colors.white24),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "No",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(4),
            backgroundColor: MaterialStateProperty.all(Colors.white),
            overlayColor: MaterialStateProperty.all(Colors.black45),
          ),
        ),
      ],
    );
  }
}
