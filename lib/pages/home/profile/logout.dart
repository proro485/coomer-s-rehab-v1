import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nofapper/constants/colors.dart';
import 'package:nofapper/constants/constants.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await notificationsPlugin.cancelAll();
        authController.signOut();
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
        child: Text("Logout", style: GoogleFonts.patrickHand(color: color2, fontSize: 16, fontWeight: FontWeight.bold),),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(width: 0.5),
          color: color7,
        ),
      ),
    );
  }
}