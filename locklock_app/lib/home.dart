import 'package:flutter/material.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color databoxColor = ColorLocked.setColor;
  bool stateOfDoor = true;

  void updateColorData() {
    setState(() {
      databoxColor = _calculateUpdatedColor();
    });
  }

  Color _calculateUpdatedColor() {
    if (stateOfDoor) {
      return Color.fromARGB(255, 89, 195, 195);
    } else {
      return Color.fromARGB(255, 244, 91, 104);
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
              cornerRadius: 25,
              cornerSmoothing: 0.8,
            ),
          ),
        ),
        child: Column(
          children: [
            Container(
              width: 250,
              height: 30,
              child: ClipRRect(
                borderRadius:
                    SmoothBorderRadius(cornerRadius: 15, cornerSmoothing: 0.8),
                child: ElevatedButton(
                  style: const ButtonStyle(
                    elevation: MaterialStatePropertyAll(0),
                  ),
                  onPressed: () {
                    setState(() {
                      stateOfDoor = !stateOfDoor;
                      updateColorData();
                    });
                  },
                  child: const Text("Switch"),
                ),
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 330),
                child: Text(
                  "Locked",
                  style: TextStyle(
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
