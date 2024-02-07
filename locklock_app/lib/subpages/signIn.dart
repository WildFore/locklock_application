import 'package:flutter/material.dart';
import 'package:locklock_app/appColors.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/cupertino.dart';
import '../appColors.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray,
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 30, 30, 30),
        centerTitle: true,
        title: const Text("Sign in"),
        titleTextStyle: const TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 235, 235, 235),
            fontFamily: "ArchivoBlack",
            fontWeight: FontWeight.w500),
      ),
      body: Column(children: [
        Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Text("", style: TextStyle(fontSize: 100)),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 0, left: 20, right: 20),
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
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, top: 10),
                child: ClipRRect(
                    borderRadius: const SmoothBorderRadius.only(
                        topLeft: SmoothRadius(
                            cornerRadius: 35, cornerSmoothing: 0.8),
                        topRight: SmoothRadius(
                            cornerRadius: 20, cornerSmoothing: 0.8),
                        bottomLeft: SmoothRadius(
                            cornerRadius: 35, cornerSmoothing: 0.8),
                        bottomRight: SmoothRadius(
                            cornerRadius: 20, cornerSmoothing: 0.8)),
                    child: Container(
                      width: 170,
                      height: 80,
                      color: Colors.transparent,
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: ClipRRect(
                    borderRadius: const SmoothBorderRadius.only(
                        topLeft: SmoothRadius(
                            cornerRadius: 35, cornerSmoothing: 0.8),
                        topRight: SmoothRadius(
                            cornerRadius: 35, cornerSmoothing: 0.8),
                        bottomLeft: SmoothRadius(
                            cornerRadius: 35, cornerSmoothing: 0.8),
                        bottomRight: SmoothRadius(
                            cornerRadius: 35, cornerSmoothing: 0.8)),
                    child: Container(
                      width: 170,
                      height: 80,
                      color: AppColors.ultraViolet,
                      child: ElevatedButton.icon(
                        icon: Icon(
                          CupertinoIcons.person_add_solid,
                          color: AppColors.antiFlashWhite,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return const SigninPage();
                          }));
                        },
                        label: Text(
                          "Sign in",
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
              )
            ],
          ),
        )
      ]),
    );
  }
}
