import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:locklock_app/addNewDevice.dart';
import 'package:locklock_app/firebase_options.dart';
import 'package:locklock_app/home.dart';
import 'package:locklock_app/settings.dart';
import 'appColors.dart';
import 'package:google_fonts/google_fonts.dart';

class DeviceCard extends StatefulWidget {
  String doorStatus;
  Color cardColor;
  DeviceCard({required this.doorStatus, required this.cardColor});

  @override
  State<DeviceCard> createState() => _DeviceCardState();
}

class _DeviceCardState extends State<DeviceCard> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("user1").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding:
                  EdgeInsets.only(left: 32, right: 32, top: 50, bottom: 50),
              child: ClipRRect(
                borderRadius: SmoothBorderRadius.all(
                    SmoothRadius(cornerRadius: 35, cornerSmoothing: 0.8)),
                child: Container(
                  width: 330,
                  height: 450,
                  color: widget.cardColor,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 330),
                      child: Text(widget.doorStatus,
                          style: GoogleFonts.getFont(
                            "Montserrat",
                            textStyle:
                                TextStyle(fontSize: 48, color: AppColors.gray),
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            throw new Exception("data corrupted");
          } else {
            return CupertinoActivityIndicator();
          }
        });
  }
}
