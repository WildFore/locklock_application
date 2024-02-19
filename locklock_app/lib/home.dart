import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:locklock_app/notificationCard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'appColors.dart';
import 'main.dart';

class ListScroll {
  static ScrollController controller = ScrollController();

  getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> doorStatusArray = ['', '', '', '', ''];
  List<Color> notiCardColor = [
    AppColors.lightGray,
    AppColors.lightGray,
    AppColors.lightGray,
    AppColors.lightGray,
    AppColors.lightGray
  ];
  List<String> timeStamps = ['', '', '', '', ''];
  List<double> timeStampPaddings = [120, 120, 120, 120, 120];
  @override
  void initState() {
    super.initState();
    // Initialize Firebase and reference to the database
    Firebase.initializeApp().then((_) {
      DatabaseReference refDoor =
          FirebaseDatabase.instance.ref().child("user1/doorStatus");
      // Listen to changes in real-time
      refDoor.onValue.listen((event) {
        if (event.snapshot.value != null) {
          // Update the state and rebuild the widget
          setState(() {
            bool isLocked = event.snapshot.value as bool;
            doorStatusArray.add(isLocked ? "Locked" : "Unlocked");
            notiCardColor
                .add(isLocked ? AppColors.robinEggBlue : AppColors.crayola);
            timeStamps.add(DateTime.now().hour.toString() + ":" + getMinutes());
            timeStampPaddings.add(isLocked ? 140 : 110);
            //ListScroll.controller.jumpTo(doorStatusArray.length * 45);
            if (doorStatusArray.length > 5) {
              doorStatusArray.removeAt(0);
              notiCardColor.removeAt(0);
              timeStamps.removeAt(0);
              timeStampPaddings.removeAt(0);
            }
          });
        }
      });
    });
  }

  String getMinutes() {
    if (DateTime.now().minute as int < 10) {
      return "0" + DateTime.now().minute.toString();
    } else
      return DateTime.now().minute.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Container(
        height: 400,
        width: 330,
        child: ListView.builder(
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
        ),
      ),
    );
  }
}
