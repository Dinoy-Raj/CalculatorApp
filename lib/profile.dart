import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'google_sign_in.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             SizedBox(height: 50,),
            Text("Profile",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),),
            SizedBox(height: 20,),
            CircleAvatar(
              backgroundImage: NetworkImage(user!.photoURL!),
            ),
            SizedBox(height: 30,),
            Text('Name : '+ user.displayName! ,style: TextStyle(
              //fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.black,
            ),),
            SizedBox(height: 15,),
            Text('Email : '+ user.email! ,style: TextStyle(
              //fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.black,
            ),),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  Navigator.pop(context);
      }, child:Text("Back")),
                SizedBox(width: 15,),
                ElevatedButton(onPressed: (){
                  final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
                  provider.LogOut();
                }, child:Text("Log Out")),

              ],
            )
          ],
        ),
      ),
    );
  }
}
