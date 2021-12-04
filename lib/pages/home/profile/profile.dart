import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nofapper/constants/colors.dart';
import 'package:nofapper/controllers/user_data_controller.dart';
import 'package:nofapper/pages/home/profile/delete.dart';
import 'package:nofapper/pages/home/profile/logout.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
          ),
          CircleAvatar(
            backgroundImage: AssetImage('assets/${Get.find<UserDataController>().userData.currentLevel - 1}.png'),
            radius: 70,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Hello, ${Get.find<UserDataController>().userData.username}', style: GoogleFonts.patrickHand(fontSize: 19, color: color7, fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            thickness: 0.9,
            color: color7,
            indent: 30,
            endIndent: 30,
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 30,
          ),
          const LogoutButton(),
          const SizedBox(
            height: 10,
          ),
          const DeleteButton(),
        ],
      ),
    );
  }
}