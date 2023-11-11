import 'package:flutter/material.dart';

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
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 89, 195, 195),
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
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
