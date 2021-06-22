import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier{
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin() async{
    try {
      final googleUser = await googleSignIn.signIn();

      if (googleUser == null) return;
      _user = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    }
    catch(e)
    {
      print("error in google login");
      SnakBar();
    }
    notifyListeners();
  }
  Future LogOut() async {
    googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }

}
Widget SnakBar(){
  return SnackBar(
content: Text('Yay! A SnackBar!'),
action: SnackBarAction(
label: 'Undo',
onPressed: () {
// Some code to undo the change.
},
),
);
}