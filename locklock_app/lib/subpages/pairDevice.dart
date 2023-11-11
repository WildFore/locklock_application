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
            fontWeight: FontWeight.w500
          ),
        ),
        body: 
        const Column(
          children: [
            Text("SSID"),
            TextField(
            ),
            Text("Password"),
            TextField(
            ),
          ],
        ),
    );
  }
}