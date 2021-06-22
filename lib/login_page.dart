import 'package:calculator/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'calculator_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(

                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:MaterialStateProperty.all(Colors.black)
                  ),
                    onPressed: () {

                    final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
                    provider.googleLogin();

                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => homeCal()));
                    },
                    child: Text("Login With Google",style: TextStyle(
                      fontSize: 15,
                      //fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
