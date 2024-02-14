import 'package:flutter/material.dart';
import 'package:locklock_app/appColors.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/cupertino.dart';
import 'package:locklock_app/services/auth_service.dart';
import 'package:locklock_app/subpages/currentUser.dart';
import '../appColors.dart';
import 'package:gradient_borders/gradient_borders.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray,
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 30, 30, 30),
        centerTitle: true,
        title: const Text(""),
        titleTextStyle: const TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 235, 235, 235),
            fontFamily: "ArchivoBlack",
            fontWeight: FontWeight.w500),
      ),
      body: Column(children: [
        Center(
          child: Padding(
            padding: EdgeInsets.only(top: 40, bottom: 20),
            child: Icon(
              CupertinoIcons.person_crop_circle_fill,
              size: 100,
              color: AppColors.lightGray,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text("Login",
                style: TextStyle(
                    fontFamily: "ArchivoBlack",
                    fontSize: 20,
                    color: AppColors.antiFlashWhite)),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(),
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextField(
              onChanged: (value) {},
              style: TextStyle(
                  fontFamily: "ArchivoBlack",
                  fontSize: 20,
                  color: AppColors.antiFlashWhite),
              maxLength: 26,
              decoration: InputDecoration(
                counterText: "",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.lightGray),
                  borderRadius: SmoothBorderRadius(
                      cornerRadius: 20, cornerSmoothing: 0.8),
                ),
                filled: true,
                fillColor: AppColors.lightGray,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.gray),
                  borderRadius: SmoothBorderRadius(
                      cornerRadius: 30, cornerSmoothing: 0.8),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text("Password",
                style: TextStyle(
                    fontFamily: "ArchivoBlack",
                    fontSize: 20,
                    color: AppColors.antiFlashWhite)),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(),
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextField(
              onChanged: (value) {},
              style: TextStyle(
                fontFamily: "ArchivoBlack",
                fontSize: 20,
                color: AppColors.antiFlashWhite,
              ),
              maxLength: 26,
              decoration: InputDecoration(
                counterText: "",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.lightGray),
                  borderRadius: SmoothBorderRadius(
                      cornerRadius: 20, cornerSmoothing: 0.8),
                ),
                filled: true,
                fillColor: AppColors.lightGray,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.gray),
                  borderRadius: SmoothBorderRadius(
                      cornerRadius: 30, cornerSmoothing: 0.8),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Center(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: ClipRRect(
                      borderRadius: const SmoothBorderRadius.only(
                          topLeft: SmoothRadius(
                              cornerRadius: 25, cornerSmoothing: 0.8),
                          topRight: SmoothRadius(
                              cornerRadius: 15, cornerSmoothing: 0.8),
                          bottomLeft: SmoothRadius(
                              cornerRadius: 25, cornerSmoothing: 0.8),
                          bottomRight: SmoothRadius(
                              cornerRadius: 15, cornerSmoothing: 0.8)),
                      child: Container(
                        width: 170,
                        height: 70,
                        decoration: const BoxDecoration(
                            borderRadius: SmoothBorderRadius.only(
                                topLeft: SmoothRadius(
                                    cornerRadius: 25, cornerSmoothing: .8),
                                topRight: SmoothRadius(
                                    cornerRadius: 15, cornerSmoothing: .8),
                                bottomLeft: SmoothRadius(
                                    cornerRadius: 25, cornerSmoothing: .8),
                                bottomRight: SmoothRadius(
                                    cornerRadius: 15, cornerSmoothing: .8)),
                            border: GradientBoxBorder(
                                width: 4,
                                gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    Color.fromRGBO(66, 134, 244, 1),
                                    Color.fromRGBO(219, 68, 55, 1),
                                    Color.fromRGBO(244, 180, 0, 1),
                                    Color.fromRGBO(15, 157, 88, 1),
                                    Color.fromRGBO(66, 134, 244, 1),
                                  ],
                                ))),
                        child: ElevatedButton.icon(
                          icon: Icon(
                            CupertinoIcons.person_badge_plus_fill,
                            size: 30,
                            color: AppColors.antiFlashWhite,
                          ),
                          onPressed: () async {
                            AuthService().signInWithGoogle(context);
                          },
                          label: Text(
                            "Google",
                            style: TextStyle(
                                color: AppColors.antiFlashWhite,
                                fontFamily: "ArchivoBlack",
                                fontSize: 20),
                          ),
                          style: ButtonStyle(
                              splashFactory: NoSplash.splashFactory,
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.transparent)),
                        ),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: ClipRRect(
                      borderRadius: const SmoothBorderRadius.only(
                          topLeft: SmoothRadius(
                              cornerRadius: 15, cornerSmoothing: 0.8),
                          topRight: SmoothRadius(
                              cornerRadius: 25, cornerSmoothing: 0.8),
                          bottomLeft: SmoothRadius(
                              cornerRadius: 15, cornerSmoothing: 0.8),
                          bottomRight: SmoothRadius(
                              cornerRadius: 25, cornerSmoothing: 0.8)),
                      child: Container(
                        width: 170,
                        height: 70,
                        color: AppColors.crayola,
                        child: ElevatedButton.icon(
                          icon: Icon(
                            CupertinoIcons.capslock_fill,
                            color: AppColors.gray,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                              return const CurrentUserPage();
                            }));
                          },
                          label: Text(
                            "Login",
                            style: TextStyle(
                                color: AppColors.gray,
                                fontFamily: "ArchivoBlack",
                                fontSize: 20),
                          ),
                          style: ButtonStyle(
                              splashFactory: NoSplash.splashFactory,
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.transparent)),
                        ),
                      )),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
