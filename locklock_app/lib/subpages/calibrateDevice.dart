import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:locklock_app/appColors.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:locklock_app/services/auth_service.dart';
import 'package:locklock_app/subpages/calibrateDevice_calibrating.dart';

class CalibrateDevicePage extends StatefulWidget {
  const CalibrateDevicePage({super.key});

  @override
  State<CalibrateDevicePage> createState() => _CalibrateDevicePageState();
}

class _CalibrateDevicePageState extends State<CalibrateDevicePage> {
  @override
  void initState() {
    super.initState();
  }

  String? lastUserData = AuthService.userIdStream;
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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 80),
            child: Center(
                child: Icon(
              CupertinoIcons.wifi,
              size: 100,
              color: AppColors.lightGray,
            )),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 80, left: 45, right: 45),
              child: Text(
                  textAlign: TextAlign.center,
                  "Let's calibrate your device, if something went wrong.",
                  style: GoogleFonts.getFont(
                    "Montserrat",
                    textStyle: TextStyle(
                        fontSize: 24, color: AppColors.antiFlashWhite),
                    fontWeight: FontWeight.w700,
                  ))),
          Padding(
            padding: EdgeInsets.only(top: 100, left: 20, right: 20),
            child: ClipRRect(
              borderRadius: SmoothBorderRadius(
                cornerRadius: 25,
                cornerSmoothing: 0.8,
              ),
              child: Container(
                width: 300,
                height: 70,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                    splashFactory: NoSplash.splashFactory,
                    backgroundColor:
                        MaterialStatePropertyAll(AppColors.crayola),
                  ),
                  onPressed: () async {
                    DatabaseReference refDoor =
                        FirebaseDatabase.instance.ref().child("$lastUserData");
                    await refDoor.update({'needCalibrationOpen': 1});
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const CalibrateDeviceCalibratingPage();
                    }));
                  },
                  label: Text("Start callibration",
                      style: GoogleFonts.getFont(
                        "Montserrat",
                        textStyle:
                            TextStyle(fontSize: 20, color: AppColors.gray),
                        fontWeight: FontWeight.w700,
                      )),
                  icon: Icon(
                    CupertinoIcons.arrow_right_circle_fill,
                    color: AppColors.gray,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
