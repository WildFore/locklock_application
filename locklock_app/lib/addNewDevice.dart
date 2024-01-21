import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:locklock_app/subpages/pairDevice.dart';
import 'appColors.dart';

class AddDevicePage extends StatefulWidget {
  const AddDevicePage({super.key});

  @override
  State<AddDevicePage> createState() => _AddDevicePageState();
}

class _AddDevicePageState extends State<AddDevicePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 330,
      height: 450,
      decoration: ShapeDecoration(
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius(
            cornerRadius: 35,
            cornerSmoothing: 0.8,
          ),
        ),
        color: AppColors.ultraViolet,
      ),
      padding: const EdgeInsets.only(top: 100, left: 30, right: 30, bottom: 70),
      child: Column(
        children: [
          Text(
            "Let's add your device.",
            style: TextStyle(
              fontSize: 48,
              fontFamily: "ArchivoBlack",
              fontWeight: FontWeight.w500,
              color: AppColors.gray,
            ),
          ),
          Container(
            height: 50,
            width: 300,
          ),
          ClipRRect(
            borderRadius:
                SmoothBorderRadius(cornerRadius: 15, cornerSmoothing: 0.8),
            child: Container(
              width: 300,
              height: 70,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(AppColors.crayola),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const PairDevicePage();
                    }));
                  },
                  child: Text(
                    "Pair device",
                    style: TextStyle(
                      fontFamily: "ArchivoBlack",
                      fontSize: 28,
                      color: AppColors.gray,
                    ),
                  )),
            ),
          )
        ],
      ),
    ));
  }
}
