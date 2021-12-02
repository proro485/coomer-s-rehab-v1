import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nofapper/constants/colors.dart';
import 'package:nofapper/controllers/admob_service.dart';
import 'package:nofapper/controllers/user_data_controller.dart';
import 'package:nofapper/pages/home/profile/delete.dart';
import 'package:nofapper/pages/home/profile/logout.dart';
import 'package:nofapper/pages/home/profile/premium.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return !Get.find<UserDataController>().userData.premium ? SingleChildScrollView(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       const SizedBox(
    //         height: 20,
    //       ),
    //       Container(
    //         height: 50,
    //         decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(10),
    //             color: color2
    //         ),
    //         child: AdWidget(
    //           key: UniqueKey(),
    //           ad: AdMobService.createBannerAd()..load(),
    //         ),
    //       ),
    //       const SizedBox(
    //         height: 50,
    //       ),
    //       CircleAvatar(
    //         backgroundImage: AssetImage('assets/${Get.find<UserDataController>().userData.currentLevel - 1}.png'),
    //         radius: 70,
    //       ),
    //       const SizedBox(
    //         height: 10,
    //       ),
    //       Text('Hello, ${Get.find<UserDataController>().userData.username}', style: GoogleFonts.patrickHand(fontSize: 19, color: color7, fontWeight: FontWeight.bold),),
    //       const SizedBox(
    //         height: 10,
    //       ),
    //       const Divider(
    //         thickness: 0.9,
    //         color: color7,
    //         indent: 30,
    //         endIndent: 30,
    //       ),
    //       const SizedBox(
    //         height: 30,
    //       ),
    //       const Premium(),
    //       const SizedBox(
    //         height: 10,
    //       ),
    //       const LogoutButton(),
    //       const SizedBox(
    //         height: 10,
    //       ),
    //       const DeleteButton(),
    //       const SizedBox(
    //         height: 70,
    //       ),
    //       Container(
    //         height: 50,
    //         decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(10),
    //             color: color2
    //         ),
    //         child: AdWidget(
    //           key: UniqueKey(),
    //           ad: AdMobService.createBannerAd()..load(),
    //         ),
    //       ),
    //     ],
    //   ),
    // ) : SingleChildScrollView(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       const SizedBox(
    //         height: 100,
    //       ),
    //       CircleAvatar(
    //         backgroundImage: AssetImage('assets/${Get.find<UserDataController>().userData.currentLevel - 1}.png'),
    //         radius: 70,
    //       ),
    //       const SizedBox(
    //         height: 10,
    //       ),
    //       Container(
    //         padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Text('Hello, ${Get.find<UserDataController>().userData.username}', style: GoogleFonts.patrickHand(fontSize: 19, color: color7, fontWeight: FontWeight.bold),),
    //             const SizedBox(
    //               width: 5,
    //             ),
    //             const Icon(Icons.star, color: color14,),
    //           ],
    //         ),
    //       ),
    //       const SizedBox(
    //         height: 10,
    //       ),
    //       const Divider(
    //         thickness: 0.9,
    //         color: color7,
    //         indent: 30,
    //         endIndent: 30,
    //       ),
    //       const SizedBox(
    //         height: 10,
    //       ),
    //       Text('Thanks for your support it means alot', style: GoogleFonts.patrickHand(fontSize: 16, color: color7,),),
    //       const SizedBox(
    //         height: 30,
    //       ),
    //       const LogoutButton(),
    //       const SizedBox(
    //         height: 10,
    //       ),
    //       const DeleteButton(),
    //     ],
    //   ),
    // );
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
                // const SizedBox(
                //   width: 5,
                // ),
                // const Icon(Icons.star, color: color14,),
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
          // Text('Thanks for your support it means alot', style: GoogleFonts.patrickHand(fontSize: 16, color: color7,),),
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