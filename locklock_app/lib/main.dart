import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:locklock_app/addNewDevice.dart';
import 'package:locklock_app/home.dart';
import 'package:locklock_app/settings.dart';
import 'dart:ui';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndexPage = 1;
  List pages = [AddDevicePage(), HomePage(), SettingsPage()];
  String appLanding = "Home";

  //colors
  Color ultraViolet = Color.fromARGB(255, 82, 72, 156);
  Color trueBlue = Color.fromARGB(255, 64, 99, 187);
  Color robinEggBlue = Color.fromARGB(255, 89, 195, 195);
  Color antiFlashWhite = Color.fromARGB(255, 235, 235, 235);
  Color crayola = Color.fromARGB(255, 244, 91, 104);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          toolbarHeight: 150,
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 30, 30, 30),
          title: Padding(
            child: Text(appLanding),
            padding: const EdgeInsets.only(left: 10, top: 110),
          ),
          titleTextStyle: const TextStyle(
              fontSize: 36,
              color: Color.fromARGB(255, 235, 235, 235),
              fontFamily: "ArchivoBlack",
              fontWeight: FontWeight.w600),
        ),
        body: pages[_selectedIndexPage],
        backgroundColor: Color.fromARGB(255, 30, 30, 30),
        bottomNavigationBar: Container(
          height: 100,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            child: NavigationBar(
                animationDuration: const Duration(microseconds: 0),
                backgroundColor: Colors.transparent,
                indicatorColor: robinEggBlue,
                selectedIndex: _selectedIndexPage,
                labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                indicatorShape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                destinations: const [
                  NavigationDestination(
                      icon: Icon(CupertinoIcons.plus_circle_fill,
                          color: Color.fromARGB(255, 235, 235, 235)),
                      selectedIcon: Icon(CupertinoIcons.plus_circle_fill,
                          color: Color.fromARGB(255, 30, 30, 30)),
                      label: "Add new device"),
                  NavigationDestination(
                      icon: Icon(CupertinoIcons.house_fill,
                          color: Color.fromARGB(255, 235, 235, 235)),
                      selectedIcon: Icon(CupertinoIcons.house_fill,
                          color: Color.fromARGB(255, 30, 30, 30)),
                      label: "Home"),
                  NavigationDestination(
                      icon: Icon(CupertinoIcons.gear_alt_fill,
                          color: Color.fromARGB(255, 235, 235, 235)),
                      selectedIcon: Icon(
                        CupertinoIcons.gear_alt_fill,
                        color: Color.fromARGB(255, 30, 30, 30),
                      ),
                      label: "Settings")
                ],
                onDestinationSelected: (int index) {
                  setState(() {
                    _selectedIndexPage = index;
                    switch (index) {
                      case 0:
                        appLanding = "Add new device";
                      case 1:
                        appLanding = "Home";
                      case 2:
                        appLanding = "Settings";
                    }
                  });
                }),
          ),
        ),
      ),
    );
  }
}
