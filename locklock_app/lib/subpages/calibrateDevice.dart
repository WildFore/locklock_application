import 'package:flutter/material.dart';
import 'package:locklock_app/appColors.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/cupertino.dart';

class CalibrateDevicePage extends StatefulWidget {
  const CalibrateDevicePage({super.key});

  @override
  State<CalibrateDevicePage> createState() => _CalibrateDevicePageState();
}

class _CalibrateDevicePageState extends State<CalibrateDevicePage> {
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
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Text(
                  textAlign: TextAlign.center,
                  "Let's calibrate your device, if something went wrong.",
                  style: TextStyle(
                      fontFamily: "ArchivoBlack",
                      fontSize: 26,
                      fontWeight: FontWeight.w100,
                      color: AppColors.antiFlashWhite))),
          Padding(
            padding: EdgeInsets.only(top: 100, left: 20, right: 20),
            child: ClipRRect(
              borderRadius: SmoothBorderRadius(
                cornerRadius: 25,
                cornerSmoothing: 0.8,
              ),
              child: Container(
                width: 260,
                height: 70,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                    splashFactory: NoSplash.splashFactory,
                    backgroundColor:
                        MaterialStatePropertyAll(AppColors.crayola),
                  ),
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  label: Text(
                    "Start callibration",
                    style: TextStyle(
                      fontFamily: "ArchivoBlack",
                      fontSize: 20,
                      color: AppColors.gray,
                    ),
                  ),
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
