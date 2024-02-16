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
import 'package:shared_preferences/shared_preferences.dart';

class CurrentUserPage extends StatefulWidget {
  const CurrentUserPage({super.key});

  @override
  State<CurrentUserPage> createState() => _CalibrateDevicePageState();
}

class _CalibrateDevicePageState extends State<CurrentUserPage> {
  getUserImage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('img');
  }

  bool toggle = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.gray,
        appBar: AppBar(
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
          Padding(
            padding: EdgeInsets.only(top: 40),
            child: Center(
              child: FutureBuilder<dynamic>(
                  future: getUserImage(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            border: GradientBoxBorder(
                                width: 4,
                                gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    AppColors.robinEggBlue,
                                    AppColors.crayola,
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
                          width: 120,
                          height: 120,
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
        ]));
  }
}
