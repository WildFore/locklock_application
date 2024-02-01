import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:locklock_app/addNewDevice.dart';
import 'package:locklock_app/home.dart';
import 'package:locklock_app/settings.dart';
import 'appColors.dart';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class ColorUnlocked {
  static final setColor = AppColors.crayola;
}

class ColorLocked {
  static final setColor = AppColors.robinEggBlue;
}

class _HomeState extends State<Home> {
  int _selectedIndexPage = 1;
  List pages = const [AddDevicePage(), HomePage(), SettingsPage()];
  String appLanding = "Home";

  //colors

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          toolbarHeight: 140,
          elevation: 0,
          backgroundColor: AppColors.gray,
          title: Padding(
            child: Text(appLanding),
            padding: const EdgeInsets.only(left: 15, top: 110),
          ),
          titleTextStyle: TextStyle(
              fontSize: 30,
              color: AppColors.antiFlashWhite,
              fontFamily: "ArchivoBlack",
              fontWeight: FontWeight.w600),
        ),
        body: pages[_selectedIndexPage],
        backgroundColor: const Color.fromARGB(255, 30, 30, 30),
        bottomNavigationBar: Container(
          height: 100,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          ),
          child: ClipRRect(
            borderRadius: const SmoothBorderRadius.only(
              topLeft: SmoothRadius(cornerRadius: 30, cornerSmoothing: 0.8),
              topRight: SmoothRadius(cornerRadius: 30, cornerSmoothing: 0.8),
            ),
            child: NavigationBar(
                animationDuration: const Duration(microseconds: 0),
                backgroundColor: const Color.fromARGB(255, 44, 44, 44),
                indicatorColor: const Color.fromARGB(0, 45, 45, 45),
                selectedIndex: _selectedIndexPage,
                labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                indicatorShape: const CircleBorder(),
                destinations: [
                  NavigationDestination(
                      icon: Icon(CupertinoIcons.plus_circle,
                          color: AppColors.antiFlashWhite),
                      selectedIcon: Icon(CupertinoIcons.plus_circle_fill,
                          color: AppColors.antiFlashWhite),
                      label: "Add new device"),
                  NavigationDestination(
                      icon: Icon(CupertinoIcons.house,
                          color: AppColors.antiFlashWhite),
                      selectedIcon: Icon(CupertinoIcons.house_fill,
                          color: AppColors.antiFlashWhite),
                      label: "Home"),
                  NavigationDestination(
                      icon: Icon(CupertinoIcons.gear_alt,
                          color: AppColors.antiFlashWhite),
                      selectedIcon: Icon(CupertinoIcons.gear_alt_fill,
                          color: AppColors.antiFlashWhite),
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
