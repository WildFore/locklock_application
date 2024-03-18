import 'package:figma_squircle/figma_squircle.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:locklock_app/addNewDevice.dart';
import 'package:locklock_app/firebase_options.dart';
import 'package:locklock_app/home.dart';
import 'package:locklock_app/services/auth_service.dart';
import 'package:locklock_app/settings.dart';
import 'package:locklock_app/subpages/history.dart';
import 'package:locklock_app/subpages/pairDevice.dart';
import 'appColors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AuthService.getUserTokenAync();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
  int _selectedIndexPage = 0;
  List pages = const [HomePage(), SettingsPage()];
  String appLanding = "Home";
  bool visibility = true;

  //colors

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: false,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            actions: [
              Builder(
                builder: (context) {
                  return Visibility(
                    visible: visibility,
                    child: Padding(
                      padding: EdgeInsets.only(top: 100, right: 20),
                      child: IconButton(
                        iconSize: 30,
                        icon: Icon(CupertinoIcons.add_circled_solid),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PairDevicePage(),
                          ));
                        },
                      ),
                    ),
                  );
                },
              )
            ],
            centerTitle: false,
            toolbarHeight: 140,
            elevation: 0,
            backgroundColor: AppColors.gray,
            title: Padding(
              child: Text(appLanding),
              padding: const EdgeInsets.only(left: 15, top: 105),
            ),
            titleTextStyle: GoogleFonts.getFont(
              "Montserrat",
              textStyle:
                  TextStyle(fontSize: 32, color: AppColors.antiFlashWhite),
              fontWeight: FontWeight.w700,
            )),
        body: Column(
          children: [
            Center(
              child: Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
                child: Container(
                  height: 400,
                  child: pages[_selectedIndexPage],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: ClipRRect(
                borderRadius: SmoothBorderRadius.all(
                    SmoothRadius(cornerRadius: 30, cornerSmoothing: 1)),
                child: Container(
                  width: 120,
                  height: 30,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Visibility(
                    visible: visibility,
                    child: Builder(builder: (context) {
                      return ElevatedButton.icon(
                        icon: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Icon(
                              CupertinoIcons.doc_text_fill,
                              size: 18,
                              color: AppColors.gray,
                            ),
                          ),
                        ),
                        style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.only(right: 10)),
                          elevation: const MaterialStatePropertyAll(0),
                          splashFactory: NoSplash.splashFactory,
                          backgroundColor: MaterialStatePropertyAll(
                              AppColors.antiFlashWhite),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HistoryPage(),
                          ));
                        },
                        label: Align(
                            alignment: Alignment.center,
                            child: Text("History",
                                style: GoogleFonts.getFont(
                                  "Montserrat",
                                  textStyle: TextStyle(
                                      fontSize: 18, color: AppColors.gray),
                                  fontWeight: FontWeight.w600,
                                ))),
                      );
                    }),
                  ),
                ),
              ),
            )
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 30, 30, 30),
        bottomNavigationBar: Container(
          height: 100,
          decoration: const BoxDecoration(
            color: Colors.transparent,
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
                backgroundColor: Colors.transparent,
                indicatorColor: AppColors.ultraViolet,
                selectedIndex: _selectedIndexPage,
                labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                indicatorShape: RoundedRectangleBorder(
                    borderRadius: SmoothBorderRadius(
                        cornerRadius: 16, cornerSmoothing: 0.8)),
                destinations: [
                  NavigationDestination(
                      icon: Icon(CupertinoIcons.house_fill,
                          color: AppColors.antiFlashWhite),
                      selectedIcon: Icon(CupertinoIcons.house_fill,
                          color: AppColors.antiFlashWhite),
                      label: ""),
                  NavigationDestination(
                      icon: Icon(CupertinoIcons.gear_alt_fill,
                          color: AppColors.antiFlashWhite),
                      selectedIcon: Icon(CupertinoIcons.gear_alt_fill,
                          color: AppColors.antiFlashWhite),
                      label: "")
                ],
                onDestinationSelected: (int index) {
                  setState(() {
                    _selectedIndexPage = index;
                    switch (index) {
                      case 0:
                        appLanding = "Home";
                        visibility = true;
                      case 1:
                        appLanding = "Settings";
                        visibility = false;
                    }
                  });
                }),
          ),
        ),
      ),
    );
  }
}
