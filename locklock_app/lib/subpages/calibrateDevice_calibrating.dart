import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:locklock_app/appColors.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:locklock_app/home.dart';
import 'package:locklock_app/services/auth_service.dart';
import 'package:locklock_app/settings.dart';
import 'package:locklock_app/subpages/calibrateDevice.dart';
import 'package:locklock_app/subpages/calibrateDeviceDone.dart';

class CalibrateDeviceCalibratingPage extends StatefulWidget {
  const CalibrateDeviceCalibratingPage({super.key});

  @override
  State<CalibrateDeviceCalibratingPage> createState() =>
      _CalibrateDevicePageState();
}

class _CalibrateDevicePageState extends State<CalibrateDeviceCalibratingPage> {
  String? lastUser;
  @override
  void initState() {
    super.initState();
    lastUser = AuthService.userIdStream;
    DatabaseReference ref =
        FirebaseDatabase.instance.ref().child("$lastUser/needCalibrationOpen");
    ref.onValue.listen((event) {
      if (event.snapshot.value != 0) {
      } else {
        try {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return const CalibrateDeviceDonePage();
          }));
        } catch (e) {
          throw new Exception(e);
        }
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.chevron_back),
          onPressed: () async {
            DatabaseReference refDoor =
                FirebaseDatabase.instance.ref().child("$lastUser");
            await refDoor.update({'needCalibrationOpen': 0});
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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 180),
            child: Container(
              child: CupertinoActivityIndicator(
                radius: 28,
                color: AppColors.antiFlashWhite,
                animating: true,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120, left: 45, right: 45),
            child: ClipRRect(
              borderRadius: SmoothBorderRadius.all(
                  SmoothRadius(cornerRadius: 10, cornerSmoothing: .6)),
              child: Container(
                width: 310,
                height: 80,
                color: AppColors.lightGray,
                child: Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    textAlign: TextAlign.left,
                    "Wait untill the calibrations end, it takes nearly 30 seconds :)",
                    style: GoogleFonts.getFont(
                      "Cousine",
                      textStyle: TextStyle(
                          fontSize: 18, color: AppColors.antiFlashWhite),
                      fontWeight: FontWeight.w700,
                    ),
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
