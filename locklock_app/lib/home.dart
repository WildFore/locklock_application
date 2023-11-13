import 'package:flutter/material.dart';
import 'package:figma_squircle/figma_squircle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 330,
          height: 450,
          decoration: ShapeDecoration(
              color: Color.fromARGB(255, 89, 195, 195),
              shape: SmoothRectangleBorder(
                  borderRadius: SmoothBorderRadius(
                cornerRadius: 25,
                cornerSmoothing: 0.8,
              ))),
          child: const Center(
            child: Padding(
                padding: EdgeInsets.only(top: 330),
                child: Text(
                  "Locked",
                  style: TextStyle(
                      fontSize: 48,
                      fontFamily: "ArchivoBlack",
                      fontWeight: FontWeight.w500),
                )),
          )),
    );
  }
}
