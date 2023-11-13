import 'package:flutter/material.dart';

class CalibrateDevicePage extends StatefulWidget {
  const CalibrateDevicePage({super.key});

  @override
  State<CalibrateDevicePage> createState() => _CalibrateDevicePageState();
}

class _CalibrateDevicePageState extends State<CalibrateDevicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 30, 30, 30),
        centerTitle: true,
        title: Text("Calibrate your device"),
        titleTextStyle: const TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 235, 235, 235),
            fontFamily: "ArchivoBlack",
            fontWeight: FontWeight.w500),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
