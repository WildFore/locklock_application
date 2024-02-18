import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:locklock_app/notificationCard.dart';
import 'appColors.dart';
import 'main.dart';

class ListScroll {
  static ScrollController controller = ScrollController();
  static void scrollToItem(int index) {
    // Use animateTo for smooth scrolling
    controller.animateTo(
      index * 50.0, // Adjust the value based on your item size
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> doorStatusArray = [];
  List<Color> notiCardColor = [];
  List<String> timeStamps = [];
  List<double> timeStampPaddings = [];
  @override
  void initState() {
    super.initState();
    // Initialize Firebase and reference to the database
    Firebase.initializeApp().then((_) {
      DatabaseReference ref =
          FirebaseDatabase.instance.ref().child("user1/doorStatus");
      // Listen to changes in real-time
      ref.onValue.listen((event) {
        if (event.snapshot.value != null) {
          // Update the state and rebuild the widget
          setState(() {
            bool isLocked = event.snapshot.value as bool;
            doorStatusArray.add(isLocked ? "Locked" : "Unlocked");
            notiCardColor
                .add(isLocked ? AppColors.robinEggBlue : AppColors.crayola);
            timeStamps.add(DateTime.now().hour.toString() +
                ":" +
                DateTime.now().minute.toString());
            timeStampPaddings.add(isLocked ? 120 : 90);
            ListScroll.controller.jumpTo(doorStatusArray.length * 45);
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: ListScroll.controller,
      shrinkWrap: true,
      reverse: true,
      itemCount: doorStatusArray.length,
      itemBuilder: (context, index) {
        return NotificationCard(
          doorStatus: doorStatusArray[index],
          cardColor: notiCardColor[index],
          timeStamp: timeStamps[index],
          timeStampPadding: timeStampPaddings[index],
        );
      },
    );
  }
}
