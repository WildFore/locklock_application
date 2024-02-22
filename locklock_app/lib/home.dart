import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:locklock_app/notificationCard.dart';
import 'package:locklock_app/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'appColors.dart';
import 'main.dart';

class ListScroll {
  static ScrollController controller = ScrollController();
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static String? lastUser;
  List<String> doorStatusArray = ['', '', '', ''];
  List<Color> notiCardColor = [
    AppColors.lightGray,
    AppColors.lightGray,
    AppColors.lightGray,
    AppColors.lightGray
  ];
  List<String> timeStamps = ['', '', '', ''];
  List<double> widths = [310, 310, 310, 310];
  List<double> heights = [70, 70, 70, 70];
  List<double> paddingsLeft = [0, 0, 0, 0];
  List<double> paddingsRight = [0, 0, 0, 0];
  List<double> topPaddings = [0, 0, 0, 0];
  List<double> fontSizes = [28, 28, 28, 28];
  @override
  void initState() {
    super.initState();
    AuthService.getUserTokenAync();
    String? lastUserData = AuthService.userIdStream;
    print(lastUserData);
    // Initialize Firebase and reference to the database
    Firebase.initializeApp().then((_) {
      DatabaseReference refDoor =
          FirebaseDatabase.instance.ref().child("$lastUserData/doorStatus");
      // Listen to changes in real-time
      refDoor.onValue.listen((event) {
        if (event.snapshot.value != null) {
          // Update the state and rebuild the widget
          setState(() {
            bool isLocked = event.snapshot.value as bool;
            doorStatusArray.add(isLocked ? "Unlocked" : "Locked");
            notiCardColor
                .add(isLocked ? AppColors.robinEggBlue : AppColors.crayola);
            if (doorStatusArray.length == 2) {
              widths[1] = 330;
              heights[1] = 400;
              widths[0] = 200;
              heights[0] = 20;
              paddingsLeft[1] = 0;
              paddingsRight[1] = 0;
              paddingsLeft[0] = 60;
              paddingsRight[0] = 60;
              topPaddings[1] = 0;
              topPaddings[0] = 0;
            }
            if (doorStatusArray.length > 3) {
              doorStatusArray.removeAt(0);
              notiCardColor.removeAt(0);
              timeStamps.removeAt(0);
            }
            timeStamps.add(DateTime.now().hour.toString() + ":" + getMinutes());
            //ListScroll.controller.jumpTo(doorStatusArray.length * 45);
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
        height: 500,
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
              width: widths[index],
              height: heights[index],
              paddingLeft: paddingsLeft[index],
              paddingRight: paddingsRight[index],
              topPadding: topPaddings[index],
              fontSize: fontSizes[index],
            );
          },
        ),
      ),
    );
  }
}
