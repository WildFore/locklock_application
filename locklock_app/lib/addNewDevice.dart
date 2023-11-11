import 'package:flutter/material.dart';
import 'package:locklock_app/subpages/pairDevice.dart';

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
        width: 360,
        height: 500,
        decoration: const BoxDecoration(
           color: Color.fromARGB(255, 82, 72, 156),
           borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        padding: EdgeInsets.only(top: 100, left: 30, right: 30, bottom: 50),
        child: Column(
          children: [
            const Text(
                "Let's add your device.",
                style: TextStyle(
                  fontSize: 48,
                  fontFamily: "ArchivoBlack",
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 30, 30, 30),
                ),
              ),
            Container(
              height: 100,
              width: 300,
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: Container(
                width: 300,
                height: 70,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 244, 91, 104)),
                  ),
                  onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context){
                      return const PairDevicePage();
                    })
                  );
                }, child: const Text(
                  "Pair device", 
                  style: TextStyle(
                    fontFamily: "ArchivoBlack",
                    fontSize: 24,
                    color: Color.fromARGB(255, 30, 30, 30),
                  ),)),
              ),
            )
          ],
        ),
      )
      );
  }
}