import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:locklock_app/subpages/welcomeUser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static String lastUserId = "";

  getCurrentUser() async {
    return await firebaseAuth.currentUser;
  }

  signInWithGoogle(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
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
        print(userDetails.providerData);
        lastUserId = userDetails.uid;

        User? firebaseUser = FirebaseAuth.instance.currentUser;
        FirebaseFirestore.instance.collection("users").doc("$lastUserId").set({
          'user-name': userDetails.displayName,
          'door-status': 'false',
          'need-calibration': 'false'
        });
        prefs.setString('user', lastUserId);
        prefs.setString('img', userDetails.photoURL.toString());
        prefs.setString('username', userDetails.displayName.toString());
        prefs.setBool('loggedIn', true);

        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return const WelcomeUserPage();
        }));
      }
    } catch (e) {
      print("Error during Google Sign-In: $e");
      // Handle the error
    }
    InitializeUserData();
  }

  static InitializeUserData() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("$lastUserId");
    await ref.set({'needCalibrationOpen': 0, "doorStatus": false});
  }

  static logOut() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    FirebaseAuth.instance.signOut();
    prefs.setBool('loggedIn', false);
  }
}
