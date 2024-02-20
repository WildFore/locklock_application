import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:locklock_app/appColors.dart';
import 'package:locklock_app/home.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:locklock_app/services/auth_service.dart';

class PairDevicePage extends StatefulWidget {
  const PairDevicePage({super.key});

  @override
  State<PairDevicePage> createState() => _PairDevicePageState();
}

class _PairDevicePageState extends State<PairDevicePage> {
  bool buttonIsActive = true;

  String ssid = "";

  String password = "";

  String output = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray,
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 30, 30, 30),
        centerTitle: true,
        title: Text("Let's pair your device."),
        titleTextStyle: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 235, 235, 235),
            fontFamily: "ArchivoBlack",
            fontWeight: FontWeight.w500),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 160, left: 20, right: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("SSID",
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
                onChanged: (value) {
                  ssid = value;
                },
                style: TextStyle(
                    fontFamily: "ArchivoBlack",
                    fontSize: 20,
                    color: AppColors.antiFlashWhite),
                maxLength: 26,
                decoration: InputDecoration(
                  counterText: " ",
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
            padding: EdgeInsets.only(top: 0, left: 20, right: 20),
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
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextField(
              onChanged: (value) {
                password = value;
              },
              style: TextStyle(
                fontFamily: "ArchivoBlack",
                fontSize: 20,
                color: AppColors.antiFlashWhite,
              ),
              maxLength: 26,
              decoration: InputDecoration(
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
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: ClipRRect(
              borderRadius: SmoothBorderRadius(
                cornerRadius: 25,
                cornerSmoothing: 0.8,
              ),
              child: Container(
                width: 220,
                height: 80,
                child: ElevatedButton.icon(
                    icon: Icon(
                      CupertinoIcons.add_circled_solid,
                      size: 30,
                      color: AppColors.gray,
                    ),
                    style: ButtonStyle(
                      splashFactory: NoSplash.splashFactory,
                      backgroundColor:
                          MaterialStatePropertyAll(AppColors.crayola),
                    ),
                    onPressed: () async {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => CupertinoAlertDialog(
                          title: const Text('Processing'),
                          content: const Text('Data was sent to your device'),
                          actions: <Widget>[
                            TextButton(
                              style: const ButtonStyle(
                                splashFactory: NoSplash.splashFactory,
                              ),
                              onPressed: () => Navigator.pop(context, 'Ok'),
                              child: const Text('Ok'),
                            ),
                          ],
                        ),
                      );

                      if (!buttonIsActive) {
                        return;
                      }
                      buttonIsActive = false;

                      var url = Uri.http('192.168.4.1', '/wifi');
                      var response = await http.post(url, body: {
                        'ssid': ssid,
                        'password': password,
                        'user-id': AuthService.userIdStream
                      });
                      print('Response status: ${response.statusCode}');
                      print('Response body: ${response.body}');
                      buttonIsActive = true;

                      setState(() {
                        output = response.statusCode.toString();
                      });
                    },
                    label: Text(
                      "Pair device",
                      style: TextStyle(
                        fontFamily: "ArchivoBlack",
                        fontSize: 20,
                        color: AppColors.gray,
                      ),
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              output,
              style: TextStyle(
                fontFamily: "ArchivoBlack",
                fontSize: 20,
                color: AppColors.antiFlashWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
