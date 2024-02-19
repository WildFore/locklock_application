import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:locklock_app/appColors.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:locklock_app/services/auth_service.dart';
import 'package:locklock_app/subpages/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeUserPage extends StatefulWidget {
  const WelcomeUserPage({super.key});

  @override
  State<WelcomeUserPage> createState() => _CalibrateDevicePageState();
}

class _CalibrateDevicePageState extends State<WelcomeUserPage> {
  getUserImage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('img');
  }

  getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('username');
  }

  bool toggle = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.gray,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(CupertinoIcons.chevron_back),
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
          toolbarHeight: 70,
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 30, 30, 30),
          centerTitle: true,
          title: Text(""),
          titleTextStyle: const TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 235, 235, 235),
              fontFamily: "ArchivoBlack",
              fontWeight: FontWeight.w500),
        ),
        body: Column(children: [
          Padding(padding: EdgeInsets.only(top: 60)),
          Padding(
            padding: EdgeInsets.only(top: 40),
            child: Center(
              child: FutureBuilder<dynamic>(
                  future: getUserImage(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            border: GradientBoxBorder(
                                width: 4,
                                gradient: LinearGradient(
                                  stops: [.2, .6],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    AppColors.robinEggBlue,
                                    AppColors.ultraViolet,
                                  ],
                                )),
                            borderRadius: const SmoothBorderRadius.all(
                                SmoothRadius(
                                    cornerRadius: 100, cornerSmoothing: 0)),
                            image: DecorationImage(
                              image: NetworkImage(snapshot.data!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          width: 130,
                          height: 130,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage("assets/app.png"),
                            fit: BoxFit.cover,
                          )),
                        );
                      }
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 50, left: 20, right: 20),
              child: FutureBuilder<dynamic>(
                  future: getUserName(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return Text('Hello, ' + snapshot.data! + "! :D",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont(
                              "Montserrat",
                              textStyle: TextStyle(
                                  fontSize: 24,
                                  color: AppColors.antiFlashWhite),
                              fontWeight: FontWeight.bold,
                            ));
                      } else {
                        return Text('Hello, User! :D',
                            style: TextStyle(
                              fontSize: 24,
                              color: AppColors.antiFlashWhite,
                              fontWeight: FontWeight.bold,
                            ));
                      }
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 50),
              child: ClipRRect(
                borderRadius: const SmoothBorderRadius.only(
                    topLeft:
                        SmoothRadius(cornerRadius: 25, cornerSmoothing: 0.8),
                    topRight:
                        SmoothRadius(cornerRadius: 25, cornerSmoothing: 0.8),
                    bottomLeft:
                        SmoothRadius(cornerRadius: 25, cornerSmoothing: 0.8),
                    bottomRight:
                        SmoothRadius(cornerRadius: 25, cornerSmoothing: 0.8)),
                child: Container(
                  width: 160,
                  height: 80,
                  color: AppColors.crayola,
                  child: ElevatedButton.icon(
                    icon: Icon(
                      CupertinoIcons.person_badge_minus_fill,
                      color: AppColors.gray,
                      size: 30,
                    ),
                    onPressed: () async {
                      AuthService.logOut();
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    label: Text(
                      "Log out",
                      style: GoogleFonts.getFont(
                        "Montserrat",
                        textStyle:
                            TextStyle(fontSize: 20, color: AppColors.gray),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    style: ButtonStyle(
                        splashFactory: NoSplash.splashFactory,
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.transparent)),
                  ),
                ),
              ),
            ),
          )
        ]));
  }
}
