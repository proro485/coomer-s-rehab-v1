import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nofapper/constants/colors.dart';
import 'package:nofapper/constants/constants.dart';
import 'package:nofapper/pages/home/leaderboard/leaderboard_fetching.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({Key? key}) : super(key: key);

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              setState(() {
                indexTopX = (indexTopX + 1) % 7;
                leaderboardStream = database.child('users').orderByChild('startTime').limitToFirst(topX[indexTopX]).onValue;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              width: 250,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: color7,
              ),
              child: Text('Realtime Leaderboard Top : ${topX[indexTopX]}', style: GoogleFonts.patrickHand(fontSize: 18, color: color2, fontWeight: FontWeight.bold),),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 20,
          ),
          LeaderboardFetch(),
        ],
      ),
    );
  }
}
