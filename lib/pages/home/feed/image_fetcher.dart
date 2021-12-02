import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nofapper/constants/colors.dart';
import 'package:nofapper/constants/constants.dart';
import 'package:nofapper/controllers/admob_service.dart';
import 'package:nofapper/controllers/user_data_controller.dart';

class ImageFetch extends StatelessWidget {
  const ImageFetch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // bool isPremium = Get.find<UserDataController>().userData.premium;
    bool isPremium = true;
    return StreamBuilder(
      stream: imagesStream,
      builder: (context, snapshot) {
        final tilesList = <Widget>[];
        int count = 0;
        if (snapshot.hasData) {
          final images = Map<String, dynamic>.from((snapshot.data! as Event).snapshot.value);
          images.forEach((key, value) {
            count++;
            final imgTile = Container(
              width: MediaQuery.of(context).size.width - 20,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              decoration: BoxDecoration(
                color: color3,
                border: Border.all(color: color7, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(value, width: MediaQuery.of(context).size.width - 50,),
            );
            tilesList.add(imgTile);
            tilesList.add(const SizedBox(
              height: 20.0,
            ));
            if (count % 2 == 0 && !isPremium) {
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
                height: 20.0,
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
