import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:nofapper/constants/colors.dart';
import 'package:nofapper/constants/constants.dart';
import 'package:nofapper/controllers/user_data_controller.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserDataController>(
        builder: (_) {
          return Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 15.0, horizontal: 20.0),
              width: MediaQuery
                  .of(context)
                  .size
                  .width - 20.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(width: 1.0, color: color7),
                color: color3,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 5.0,
                      ),
                      Image.asset(
                        'assets/${Get.find<UserDataController>().userData.currentLevel -
                            1}.png', height: 120.0, width: 100.0,),
                      const SizedBox(
                        width: 45.0,
                        height: 185,
                        child: VerticalDivider(
                          thickness: 2.5,
                          color: color2,
                        ),
                      ),
                      const Stats(),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width - 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 0.5, color: color7),
                      color: color2,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width - 100,
                          height: 15,
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: LiquidLinearProgressIndicator(
                            value: DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(Get.find<UserDataController>().userData.startTime)).inSeconds/ (Get.find<UserDataController>().userData.currentGoal * 86400),
                            backgroundColor: color2,
                            valueColor: const AlwaysStoppedAnimation(color7),
                            borderColor: color7,
                            borderWidth: 2.0,
                            borderRadius: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                showAlertDialog(context);
                              },
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(
                                    25, 6, 25, 6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: color13,
                                ),
                                child: Text("I Coomed",
                                  style: GoogleFonts.patrickHand(color: color2,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
          );
        }
    );
  }
}

class Stats extends StatelessWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserDataController>(
      builder: (_) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 3, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(width: 0.5),
                color: color7,
              ),
              child: Text("Your Stats", style: GoogleFonts.patrickHand(
                  color: color2, fontSize: 16, fontWeight: FontWeight.bold),),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 3, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(width: 0.5),
                color: color5,
              ),
              child: Text(Get
                  .find<UserDataController>()
                  .userData
                  .maxStreak != 1 ? "Max Streak : ${Get
                  .find<UserDataController>()
                  .userData
                  .maxStreak} days" : "Max Streak : ${Get
                  .find<UserDataController>()
                  .userData
                  .maxStreak} day", style: GoogleFonts.patrickHand(
                  color: color2, fontSize: 16, fontWeight: FontWeight.bold),),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 3, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(width: 0.5),
                color: color10,
              ),
              child: Text("Level : ${levelName[Get
                  .find<UserDataController>()
                  .userData
                  .currentLevel - 1]}", style: GoogleFonts.patrickHand(
                  color: color2, fontSize: 16, fontWeight: FontWeight.bold),),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 3, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(width: 0.5),
                color: color11,
              ),
              child: Text(Get
                  .find<UserDataController>()
                  .userData
                  .currentGoal != 1 ? "Current Goal : ${Get
                  .find<UserDataController>()
                  .userData
                  .currentGoal} days" : "Current Goal : ${Get
                  .find<UserDataController>()
                  .userData
                  .currentGoal} day", style: GoogleFonts.patrickHand(
                  color: color2, fontSize: 16, fontWeight: FontWeight.bold),),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 3, 15, 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(width: 0.5),
                color: color9,
              ),
              child: Text(Get
                  .find<UserDataController>()
                  .userData
                  .currentStreak != 1 ? "Current Streak :  ${Get
                  .find<UserDataController>()
                  .userData
                  .currentStreak} days" : "Current Streak :  ${Get
                  .find<UserDataController>()
                  .userData
                  .currentStreak} day", style: GoogleFonts.patrickHand(
                  color: color2, fontSize: 16, fontWeight: FontWeight.bold),),
            ),
          ],
        );
      },
    );
  }
}

showAlertDialog(BuildContext context) {
  Widget cancelButton = TextButton(
    child: const Text("Cancel"),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );
  Widget yesButton = TextButton(
    child: const Text("Yes"),
    onPressed:  () async {
      Get.back();
      Get.find<UserDataController>().updatingWhenCoomed();
    },
  );
  AlertDialog alert = AlertDialog(
    title: Text("WARNING", style: GoogleFonts.patrickHand(fontSize: 20, fontWeight: FontWeight.bold),),
    content: const Text("Your streak will return back to zero. Are you sure about this?"),
    actions: [
      cancelButton,
      yesButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
    barrierDismissible: false,
  );
}