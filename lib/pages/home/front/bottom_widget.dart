import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nofapper/constants/colors.dart';
import 'package:nofapper/controllers/admob_service.dart';
import 'package:nofapper/controllers/user_data_controller.dart';
import 'image_fetch.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return !Get.find<UserDataController>().userData.premium ?
    // Column(
    //   children: [
    //     const ImageFetch(),
    //     Container(
    //       height: 50,
    //       decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(10),
    //           color: color2
    //       ),
    //       child: AdWidget(
    //         key: UniqueKey(),
    //         ad: AdMobService.createBannerAd()..load(),
    //       ),
    //     ),
    //   ],
    // ) : const ImageFetch();
    return ImageFetch();
  }
}
