import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nofapper/constants/colors.dart';
import 'package:nofapper/constants/constants.dart';

import 'login.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  var emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: color2,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 90.0,
                ),
                Text("Welcome to Coomer's Rehab", style: GoogleFonts.patrickHand(fontSize: 22, fontWeight: FontWeight.bold, color: color7),),
                Image.asset('assets/logo.png', height: 250, width:  300,),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: color7),
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    color: color3,
                  ),
                  child: TextFormField(
                    controller: emailController,
                    cursorColor: color7,
                    style: GoogleFonts.roboto(color: color7, fontSize: 15, fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Email",
                      labelText: "Email",
                      labelStyle: GoogleFonts.roboto(color: color7, fontSize: 14,),
                      hintStyle: GoogleFonts.roboto(color: color7, fontSize: 15,),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 45.0,
                ),
                InkWell(
                  onTap: () async {
                    bool isSuccessful = true;
                    if (emailController.text.isNotEmpty) {
                      try {
                        await auth.sendPasswordResetEmail(email: emailController.text.trim());
                      } catch (e) {
                        isSuccessful = false;
                        Get.snackbar(
                          "Error",
                          e.toString(),
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      }
                    }

                    if (isSuccessful) {
                      Get.back();
                      Get.snackbar(
                        "Password Reset Email is Sent",
                        "",
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                  },
                  child: Container(
                    height: 48.0,
                    width: 220,
                    padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.email_outlined, size: 24, color: color2,),
                        const SizedBox(width: 15.0,),
                        Text("Reset Password Mail", style: GoogleFonts.patrickHand(color: color2, fontSize: 16, fontWeight: FontWeight.bold),),
                        const SizedBox(width: 15.0,),
                      ],
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: color7,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.to(() => const Login());
                  },
                  child: Text("Press here to go back to Login page", style: GoogleFonts.patrickHand(fontSize: 13, color: color7),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
