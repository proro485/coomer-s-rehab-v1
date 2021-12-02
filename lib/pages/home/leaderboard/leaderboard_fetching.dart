import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nofapper/constants/colors.dart';
import 'package:nofapper/constants/constants.dart';
import 'package:nofapper/controllers/admob_service.dart';
import 'package:nofapper/controllers/user_data_controller.dart';

class LeaderboardFetch extends StatefulWidget {
  const LeaderboardFetch({Key? key}) : super(key: key);

  @override
  State<LeaderboardFetch> createState() => _LeaderboardFetchState();
}

class _LeaderboardFetchState extends State<LeaderboardFetch> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: leaderboardStream,
      builder: (context, snapshot) {
        final tilesList = <Widget>[];
        if (snapshot.hasData) {
          final myUsers = Map<String, dynamic>.from((snapshot.data! as Event).snapshot.value);
          int rank = 1;
          // bool isPremium = Get.find<UserDataController>().userData.premium;
          bool isPremium = true;

          myUsers.forEach((key, value) {
            final userDetails = Map<String, dynamic>.from(value);
            int startTime = userDetails['startTime'];
            int currentStreak = DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(startTime)).inDays;
            int currentLevel = Get.find<UserDataController>().levelAndCurrentGoal(currentStreak, false);
            final userTile = Container(
              width: MediaQuery.of(context).size.width - 25,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              decoration: BoxDecoration(
                color: color3,
                border: Border.all(color: color7, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('${rank++}.', style: GoogleFonts.patrickHand(fontSize: 18, color: color7, fontWeight: FontWeight.bold),),
                  const SizedBox(
                    width: 5.0,
                  ),
                  const SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      thickness: 3,
                      color: color2,
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text('${userDetails['username']}', style: GoogleFonts.patrickHand(fontSize: 18, color: color8, fontWeight: FontWeight.bold),),
                  const SizedBox(
                    width: 5.0,
                  ),
                  userDetails['premium'] ? const Icon(Icons.star, color: color14,) : const SizedBox(width: 5,),
                  const Spacer(),
                  Text(currentStreak != 1 ? '$currentStreak days' : '$currentStreak day', style: GoogleFonts.patrickHand(fontSize: 18, color: color9, fontWeight: FontWeight.bold),),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Image.asset('assets/${currentLevel - 1}.png', height: 50, width: 50,),
                ],
              ),
            );
            if (key != Get.find<UserDataController>().userData.userId) {
              tilesList.add(userTile);
              tilesList.add(const SizedBox(
                height: 10.0,
              ));
            } else {
              tilesList.insert(0, Container(
                width: MediaQuery.of(context).size.width - 25,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                decoration: BoxDecoration(
                  color: color2,
                  border: Border.all(color: color7, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('${rank - 1}.', style: GoogleFonts.patrickHand(fontSize: 18, color: color7, fontWeight: FontWeight.bold),),
                    const SizedBox(
                      width: 5.0,
                    ),
                    const SizedBox(
                      height: 50,
                      child: VerticalDivider(
                        thickness: 3,
                        color: color7,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text('${userDetails['username']}', style: GoogleFonts.patrickHand(fontSize: 18, color: color8, fontWeight: FontWeight.bold),),
                    const SizedBox(
                      width: 5.0,
                    ),
                    userDetails['premium'] ? const Icon(Icons.star, color: color14,) : const SizedBox(width: 5,),
                    const Spacer(),
                    Text(currentStreak != 1 ? '$currentStreak days' : '$currentStreak day', style: GoogleFonts.patrickHand(fontSize: 18, color: color9, fontWeight: FontWeight.bold),),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Image.asset('assets/${currentLevel - 1}.png', height: 50, width: 50,),
                  ],
                ),
              ));
              tilesList.insert(1, const SizedBox(
                height: 10.0,
              ));
            }
            if (rank % 5 == 0 && !isPremium) {
              tilesList.add(Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: color2
                ),
                child: AdWidget(
                  key: UniqueKey(),
                  ad: AdMobService.createBannerAd()..load(),
                ),
              ));
              tilesList.add(const SizedBox(
                height: 10.0,
              ));
            }
          });
        } else {
          return Container(
            height: MediaQuery.of(context).size.height/2 + 40,
            width: MediaQuery.of(context).size.width/2,
            color: color2,
            child: const SpinKitPouringHourGlassRefined(
              size: 50,
              color: color7,
            ),
          );
        }
        return Column(
            children: tilesList,
        );
      },
    );
  }
}
