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
import 'package:locklock_app/subpages/history.dart';
import 'appColors.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationCard extends StatefulWidget {
  String doorStatus;
  Color cardColor;
  String timeStamp;
  double width;
  double height;
  double paddingLeft;
  double paddingRight;
  double topPadding;
  double fontSize;
  NotificationCard(
      {required this.doorStatus,
      required this.cardColor,
      required this.timeStamp,
      required this.width,
      required this.height,
      required this.paddingLeft,
      required this.paddingRight,
      required this.topPadding,
      required this.fontSize});

  @override
  State<NotificationCard> createState() => _DeviceCardState();
}

class _DeviceCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: widget.paddingLeft,
          right: widget.paddingRight,
          top: 10,
          bottom: 0),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
              color: widget.cardColor,
              borderRadius: const SmoothBorderRadius.all(
                  SmoothRadius(cornerRadius: 45, cornerSmoothing: 0.8)),
              border: const GradientBoxBorder(
                  width: 1.5,
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(0, 0, 0, 0),
                    Colors.transparent,
                    Color.fromARGB(0, 0, 0, 0)
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter))),
          width: widget.width,
          height: widget.height,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: widget.topPadding),
              child: Row(children: [
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(widget.doorStatus,
                      style: GoogleFonts.getFont(
                        "Montserrat",
                        textStyle: TextStyle(
                            fontSize: widget.fontSize, color: AppColors.gray),
                        fontWeight: FontWeight.w800,
                      )),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Text(widget.timeStamp,
                      textAlign: TextAlign.end,
                      style: GoogleFonts.getFont(
                        "Montserrat",
                        textStyle: TextStyle(
                            fontSize: widget.fontSize, color: AppColors.gray),
                        fontWeight: FontWeight.w800,
                      )),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
