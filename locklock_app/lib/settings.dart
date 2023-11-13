import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:locklock_app/subpages/calibrateDevice.dart';
import 'package:locklock_app/subpages/infoPage.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 330,
        height: 450,
        decoration: ShapeDecoration(
            color: Color.fromARGB(255, 65, 65, 65),
            shape: SmoothRectangleBorder(
                borderRadius: SmoothBorderRadius(
                    cornerRadius: 25, cornerSmoothing: 0.8))),
        child: Padding(
          padding: const EdgeInsets.only(),
          child: Column(
            children: [
              Container(
                width: 360,
                height: 55,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
                child: ClipRRect(
                  borderRadius: const SmoothBorderRadius.only(
                    topLeft: SmoothRadius(
                      cornerRadius: 25,
                      cornerSmoothing: 0.8,
                    ),
                    topRight: SmoothRadius(
                      cornerRadius: 25,
                      cornerSmoothing: 0.8,
                    ),
                    bottomRight: SmoothRadius(
                      cornerRadius: 0,
                      cornerSmoothing: 0,
                    ),
                    bottomLeft: SmoothRadius(
                      cornerRadius: 0,
                      cornerSmoothing: 0,
                    ),
                  ),
                  child: ElevatedButton.icon(
                    icon: const Icon(
                      CupertinoIcons.info_circle,
                      size: 25,
                    ),
                    style: const ButtonStyle(
                      padding:
                          MaterialStatePropertyAll(EdgeInsets.only(left: 15)),
                      elevation: MaterialStatePropertyAll(0),
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.transparent),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const InfoPage();
                      }));
                    },
                    label: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Info",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "ArchivoBlack",
                          ),
                        )),
                  ),
                ),
              ),
              Container(
                width: 340,
                height: 1,
                color: Color.fromARGB(50, 235, 235, 235),
              ),
              Container(
                width: 360,
                height: 55,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                ),
                child: ElevatedButton.icon(
                  icon: const Icon(
                    CupertinoIcons.arrow_clockwise_circle,
                    size: 25,
                  ),
                  style: const ButtonStyle(
                    padding:
                        MaterialStatePropertyAll(EdgeInsets.only(left: 15)),
                    elevation: MaterialStatePropertyAll(0),
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.transparent),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const CalibrateDevicePage();
                    }));
                  },
                  label: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Calibrate device",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "ArchivoBlack",
                        ),
                      )),
                ),
              ),
              Container(
                width: 340,
                height: 1,
                color: const Color.fromARGB(50, 235, 235, 235),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
