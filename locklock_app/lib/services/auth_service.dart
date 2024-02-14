import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  getCurrentUser() async {
    return await firebaseAuth.currentUser;
  }

  signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();

      if (googleSignInAccount == null) {
        // User canceled the sign-in process
        return;
      }

      final GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount.authentication;

      if (googleSignInAuthentication == null ||
          googleSignInAuthentication.accessToken == null ||
          googleSignInAuthentication.idToken == null) {
        // Handle the case where either accessToken or idToken is null
        return;
      }
      print(googleSignInAuthentication.accessToken);
      print(googleSignInAuthentication.idToken);

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      UserCredential result =
          await firebaseAuth.signInWithCredential(credential);

      User? userDetails = result.user;
      if (result != null) {
        Map<String, dynamic> userInfoMap = {
          "email": userDetails!.email,
          "name": userDetails.displayName,
          "profileImage": userDetails.photoURL,
          "id": userDetails.uid,
        };
        // Do something with userInfoMap
      }
    } catch (e) {
      print("Error during Google Sign-In: $e");
      // Handle the error
    }
  }
}
