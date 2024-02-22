import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:locklock_app/appColors.dart';
import 'package:locklock_app/subpages/currentUser.dart';
import 'package:locklock_app/subpages/loginPage.dart';
import 'package:locklock_app/subpages/calibrateDevice.dart';
import 'package:locklock_app/subpages/infoPage.dart';
import 'package:locklock_app/subpages/welcomeUser.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
            color: Colors.transparent,
            shape: SmoothRectangleBorder(
                borderRadius: SmoothBorderRadius(
                    cornerRadius: 35, cornerSmoothing: 0.8))),
        child: Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Column(
            children: [
              Row(children: [
                ClipRRect(
                  borderRadius: const SmoothBorderRadius.only(
                    topLeft:
                        SmoothRadius(cornerRadius: 35, cornerSmoothing: 20),
                    topRight:
                        SmoothRadius(cornerRadius: 20, cornerSmoothing: 20),
                    bottomLeft:
                        SmoothRadius(cornerRadius: 20, cornerSmoothing: 20),
                    bottomRight:
                        SmoothRadius(cornerRadius: 20, cornerSmoothing: 20),
                  ),
                  child: Container(
                    width: 160,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppColors.lightGray,
                    ),
                    child: ElevatedButton.icon(
                      icon: const Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Icon(
                          CupertinoIcons.info_circle_fill,
                          size: 25,
                        ),
                      ),
                      style: const ButtonStyle(
                        splashFactory: NoSplash.splashFactory,
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
                      label: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Info",
                            style: GoogleFonts.getFont(
                              "Montserrat",
                              textStyle: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.antiFlashWhite),
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: ClipRRect(
                    borderRadius: const SmoothBorderRadius.only(
                      topLeft:
                          SmoothRadius(cornerRadius: 20, cornerSmoothing: 20),
                      topRight:
                          SmoothRadius(cornerRadius: 35, cornerSmoothing: 20),
                      bottomLeft:
                          SmoothRadius(cornerRadius: 20, cornerSmoothing: 20),
                      bottomRight:
                          SmoothRadius(cornerRadius: 20, cornerSmoothing: 20),
                    ),
                    child: Container(
                      width: 160,
                      height: 80,
                      decoration: BoxDecoration(
                        color: AppColors.lightGray,
                      ),
                      child: ElevatedButton.icon(
                        icon: const Padding(
                          padding: EdgeInsets.only(left: 25),
                          child: Icon(
                            CupertinoIcons.book_fill,
                            size: 25,
                          ),
                        ),
                        style: const ButtonStyle(
                          splashFactory: NoSplash.splashFactory,
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.only(left: 15)),
                          elevation: MaterialStatePropertyAll(0),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.transparent),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return const InfoPage();
                          }));
                        },
                        label: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Faq",
                              style: GoogleFonts.getFont(
                                "Montserrat",
                                textStyle: TextStyle(
                                    fontSize: 20,
                                    color: AppColors.antiFlashWhite),
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                      ),
                    ),
                  ),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ClipRRect(
                  borderRadius: const SmoothBorderRadius.only(
                      topLeft:
                          SmoothRadius(cornerRadius: 20, cornerSmoothing: 0.8),
                      topRight:
                          SmoothRadius(cornerRadius: 20, cornerSmoothing: 0.8),
                      bottomLeft:
                          SmoothRadius(cornerRadius: 35, cornerSmoothing: 0.8),
                      bottomRight:
                          SmoothRadius(cornerRadius: 20, cornerSmoothing: 0.8)),
                  child: Container(
                    width: 360,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: ElevatedButton.icon(
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 35),
                        child: Icon(
                          CupertinoIcons.arrow_clockwise_circle_fill,
                          size: 30,
                          color: AppColors.gray,
                        ),
                      ),
                      style: ButtonStyle(
                        padding: const MaterialStatePropertyAll(
                            EdgeInsets.only(left: 15)),
                        elevation: const MaterialStatePropertyAll(0),
                        splashFactory: NoSplash.splashFactory,
                        backgroundColor:
                            MaterialStatePropertyAll(AppColors.crayola),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return const CalibrateDevicePage();
                        }));
                      },
                      label: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Calibrate device",
                              style: GoogleFonts.getFont(
                                "Montserrat",
                                textStyle: TextStyle(
                                    fontSize: 22, color: AppColors.gray),
                                fontWeight: FontWeight.w700,
                              ))),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Container(
                      width: 160,
                      height: 80,
                      color: Colors.transparent,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: ClipRRect(
                        borderRadius: const SmoothBorderRadius.only(
                            topLeft: SmoothRadius(
                                cornerRadius: 20, cornerSmoothing: 0.8),
                            topRight: SmoothRadius(
                                cornerRadius: 20, cornerSmoothing: 0.8),
                            bottomLeft: SmoothRadius(
                                cornerRadius: 35, cornerSmoothing: 0.8),
                            bottomRight: SmoothRadius(
                                cornerRadius: 35, cornerSmoothing: 0.8)),
                        child: Container(
                          width: 160,
                          height: 80,
                          color: AppColors.lightGray,
                          child: ElevatedButton.icon(
                            icon: const Icon(
                              CupertinoIcons.person_circle_fill,
                              size: 30,
                            ),
                            onPressed: () async {
                              final SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              bool? loggedIn = prefs.getBool("loggedIn");
                              print(loggedIn);
                              if (loggedIn == true) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return const WelcomeUserPage();
                                }));
                              } else {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return const LoginPage();
                                }));
                              }
                            },
                            label: Text("User",
                                style: GoogleFonts.getFont(
                                  "Montserrat",
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color: AppColors.antiFlashWhite),
                                  fontWeight: FontWeight.w700,
                                )),
                            style: ButtonStyle(
                                splashFactory: NoSplash.splashFactory,
                                elevation: MaterialStateProperty.all(0),
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.transparent)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
