import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:locklock_app/cards.dart';
import 'appColors.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //pages
  List userCards = ['Locked'];

  //testdata
  List<String> lockedData = [
    "unlocked",
  ];
  List cardColors = [AppColors.crayola, AppColors.robinEggBlue];

  Color databoxColor = ColorLocked.setColor;
  bool stateOfDoor = false;
  String doorLocktstate = "Locked";

  void updateData() {
    setState(() {
      databoxColor = _calculateUpdatedColor();
      doorLocktstate = _newLockedData();
    });
  }

  void updateTextDoorState() {}

  Color _calculateUpdatedColor() {
    if (stateOfDoor) {
      return AppColors.robinEggBlue;
    } else {
      return AppColors.crayola;
    }
  }

  String _newLockedData() {
    if (stateOfDoor) {
      return "Locked";
    } else {
      return "Unlocked";
    }
  }

  final Future<dynamic> _fApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    DatabaseReference reference =
        FirebaseDatabase.instance.ref("user1/doorState");
    FutureBuilder<dynamic>(
      future: _fApp,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          reference.onValue.listen((event) {
            stateOfDoor = event.snapshot.value as bool;
          });
          return DeviceCard(
              doorStatus: _newLockedData(),
              cardColor: _calculateUpdatedColor());
        } else if (snapshot.hasError) {
          throw new Exception("connection failed");
        } else {
          return DeviceCard(doorStatus: "error", cardColor: AppColors.crayola);
        }
      },
    );
    return PageView.builder(
      itemCount: userCards.length,
      itemBuilder: (context, index) {
        return DeviceCard(
          doorStatus: _newLockedData(),
          cardColor: _calculateUpdatedColor(),
        );
      },
    );
  }
}
