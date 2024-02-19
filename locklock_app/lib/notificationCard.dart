import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:locklock_app/addNewDevice.dart';
import 'package:locklock_app/firebase_options.dart';
import 'package:locklock_app/home.dart';
import 'package:locklock_app/settings.dart';
import 'appColors.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationCard extends StatefulWidget {
  String doorStatus;
  Color cardColor;
  String timeStamp;
  double timeStampPadding;
  NotificationCard(
      {required this.doorStatus,
      required this.cardColor,
      required this.timeStamp,
      required this.timeStampPadding});

  @override
  State<NotificationCard> createState() => _DeviceCardState();
}

class _DeviceCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 0),
      child: Container(
        decoration: BoxDecoration(
            color: widget.cardColor,
            borderRadius: const SmoothBorderRadius.all(
                SmoothRadius(cornerRadius: 25, cornerSmoothing: 0.8)),
            border: const GradientBoxBorder(
                width: 1.8,
                gradient: LinearGradient(colors: [
                  Color.fromARGB(112, 255, 255, 255),
                  Colors.transparent,
                  Color.fromARGB(94, 0, 0, 0)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter))),
        width: 330,
        height: 70,
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 0),
            child: Row(children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(widget.doorStatus,
                    style: GoogleFonts.getFont(
                      "Montserrat",
                      textStyle: TextStyle(fontSize: 24, color: AppColors.gray),
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(left: widget.timeStampPadding),
                child: Text(widget.timeStamp,
                    textAlign: TextAlign.end,
                    style: GoogleFonts.getFont(
                      "Montserrat",
                      textStyle: TextStyle(fontSize: 24, color: AppColors.gray),
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
