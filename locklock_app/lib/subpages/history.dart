import 'package:flutter/material.dart';
import 'package:locklock_app/appColors.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray,
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 30, 30, 30),
        centerTitle: true,
        title: Text(""),
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
