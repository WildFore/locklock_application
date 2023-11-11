import 'package:flutter/material.dart';
import 'package:locklock_app/subpages/calibrateDevice.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 360,
        height: 500,       
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 65, 65, 65),
          borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top:20),
            child: Column(
              children: [
                Container(
                  width: 360,
                  height: 70,
                  child: ElevatedButton(
                    onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context){
                      return const CalibrateDevicePage();
                      })
                     );
                    },
                    child: const Text("Calibrate device")
                    ),
                )
              ],
            ),
          ),
        ),
      );
  }
}