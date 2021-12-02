import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nofapper/constants/colors.dart';
import 'package:nofapper/controllers/purchase_api.dart';

class Premium extends StatelessWidget {
  const Premium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        // fetchOffers();
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
        child: Text("Remove Ads", style: GoogleFonts.patrickHand(color: color2, fontSize: 16, fontWeight: FontWeight.bold),),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(width: 0.5),
          color: color8,
        ),
      ),
    );
  }
}

// Future fetchOffers() async {
//   final offerings = await PurchaseApi.fetchOffers();
//
//   if (offerings!.isEmpty) {
//     Get.snackbar(
//       "Error",
//       "Something is wrong please contact the developer.",
//       snackPosition: SnackPosition.BOTTOM,
//     );
//   } else {
//     final packages = offerings
//         .map((offer) => offer.availablePackages)
//         .expand((pair) => pair)
//         .toList();
//
//     Utils.showSheet(
//       context,
//           (context) => PaywallWidget(
//         packages: packages,
//         title: "Upgrade Your Plan",
//         description: "Upgrade to a new plan to enjoy more benefits.",
//         onClickedPackage: (package) async {
//
//         },
//       ),
//     );
//   }
// }