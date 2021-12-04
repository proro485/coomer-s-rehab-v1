import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nofapper/constants/colors.dart';
import 'package:nofapper/constants/constants.dart';
import 'package:nofapper/controllers/notification.dart';
import 'package:nofapper/controllers/user_data_controller.dart';
import 'package:nofapper/pages/home/home.dart';


class Setup extends StatefulWidget {
  const Setup({Key? key}) : super(key: key);

  @override
  State<Setup> createState() => _SetupState();
}

class _SetupState extends State<Setup> {

  final usernameController = TextEditingController();
  final currentStreakController = TextEditingController();
  var userId;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: color2,
        child: Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height/2 - 120,
                ),
                Text("Personalise your Account",
                  style: GoogleFonts.patrickHand(fontSize: 19, color: color7),),
                const SizedBox(
                  height: 50.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: 60,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                  margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 25.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: color3,
                  ),
                  child: TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(12),
                    ],
                    controller: usernameController,
                    cursorColor: color7,
                    style: GoogleFonts.roboto(
                        color: color7, fontSize: 15, fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Username",
                      labelText: "Create Username",
                      labelStyle: GoogleFonts.roboto(color: color7, fontSize: 14),
                      hintStyle: GoogleFonts.roboto(color: color7, fontSize: 14,),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                InkWell(
                  onTap: () async {
                    if (usernameController.text.isNotEmpty) {
                      final User? user = auth.currentUser;
                      userId = user!.uid;
                      int dateTime = DateTime.now().millisecondsSinceEpoch;
                      await notificationsPlugin.cancelAll();
                      await displayNotification();
                      try {
                        await database.child('users/$userId').set({
                          "username": usernameController.text.trim(),
                          "startTime": dateTime,
                          "premium": false,
                        });
                      } catch (e) {
                        Get.snackbar(
                          "Error",
                          e.toString(),
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      }
                      try {
                        await users.doc(userId).set({
                          "userId": userId,
                          "username": usernameController.text.trim(),
                          "currentStreak": 0,
                          "maxStreak": 0,
                          "startTime": dateTime,
                          "currentLevel": 1,
                          "currentGoal": 1,
                          "premium": false,
                        });
                      } catch (e) {
                        Get.snackbar(
                          "Error",
                          e.toString(),
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      }
                      await sharedPreferences!.setString('userId', userId);
                      await sharedPreferences!.setString('username', usernameController.text.trim());
                      await sharedPreferences!.setInt('currentStreak', 0);
                      await sharedPreferences!.setInt('maxStreak', 0);
                      await sharedPreferences!.setInt('currentGoal', 1);
                      await sharedPreferences!.setInt('currentLevel', 1);
                      await sharedPreferences!.setInt('startTime', dateTime);
                      await sharedPreferences!.setBool('premium', false);
                      Get.find<UserDataController>().updatingWhenLogin(userId, usernameController.text.trim(), 0, 0, 1, 1, dateTime, false);
                      Get.offAll(() => Home());
                    } else {
                      Get.snackbar(
                        "Error",
                        "Username field can't be empty",
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
                    margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: Text("   Submit   ", style: GoogleFonts.roboto(
                        color: color2, fontSize: 14, fontWeight: FontWeight.bold),),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: color7,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}