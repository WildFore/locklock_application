import 'package:flutter/material.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'appColors.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return Center(
      child: Container(
        width: 330,
        height: 450,
        decoration: ShapeDecoration(
          color: databoxColor,
          shape: SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius(
              cornerRadius: 35,
              cornerSmoothing: 0.8,
            ),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Container(
                width: 280,
                height: 30,
                child: ClipRRect(
                  borderRadius: SmoothBorderRadius(
                      cornerRadius: 15, cornerSmoothing: 0.8),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      elevation: MaterialStatePropertyAll(0),
                    ),
                    onPressed: () {
                      setState(() {
                        stateOfDoor = !stateOfDoor;
                        updateData();
                      });
                    },
                    child: const Text("Switch"),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 310),
                child: Text(
                  doorLocktstate,
                  style: const TextStyle(
                    fontSize: 48,
                    fontFamily: "ArchivoBlack",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
