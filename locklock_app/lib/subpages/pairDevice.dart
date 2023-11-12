import 'package:flutter/material.dart';

class PairDevicePage extends StatefulWidget {
  const PairDevicePage({super.key});

  @override
  State<PairDevicePage> createState() => _PairDevicePageState();
}

class _PairDevicePageState extends State<PairDevicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 235, 235),
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 30, 30, 30),
        centerTitle: true,
        title: Text("Let's pair your device."),
        titleTextStyle: const TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 235, 235, 235),
            fontFamily: "ArchivoBlack",
            fontWeight: FontWeight.w500),
      ),
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("SSID",
                  style: TextStyle(
                    fontFamily: "ArchivoBlack",
                    fontSize: 24,
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(),
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 30, 30, 30))),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 30, 30, 30)),
                  ),
                ),
                style: TextStyle(
                  backgroundColor: Color.fromARGB(255, 30, 30, 30),
                  color: Color.fromARGB(255, 235, 235, 235),
                  fontFamily: "ArchivoBlack",
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Password",
                  style: TextStyle(
                    fontFamily: "ArchivoBlack",
                    fontSize: 24,
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 30, 30, 30))),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 30, 30, 30)),
                ),
              ),
              style: TextStyle(
                backgroundColor: Color.fromARGB(255, 30, 30, 30),
                color: Color.fromARGB(255, 235, 235, 235),
                fontFamily: "ArchivoBlack",
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
