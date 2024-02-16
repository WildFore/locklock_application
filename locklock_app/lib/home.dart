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
  List userCards = ['Locked', 'Unlocked'];

  //testdata
  List<String> lockedData = ["unlocked", "locked"];
  List cardColors = [AppColors.crayola, AppColors.robinEggBlue];

  Color databoxColor = ColorLocked.setColor;
  bool stateOfDoor = true;
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

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: userCards.length,
      itemBuilder: (context, index) {
        return DeviceCard(
          doorStatus: lockedData[index],
          cardColor: cardColors[index],
        );
      },
    );
  }
}
