import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nofapper/constants/colors.dart';
import 'package:nofapper/constants/constants.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          color: color2,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                    height: 15.0,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                        border: Border.all(width: 1.0, color: color7),
                        color: color3
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      cursorColor: color7,
                      style: GoogleFonts.roboto(color: color7, fontSize: 15, fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Password",
                        labelText: "Password",
                        labelStyle: GoogleFonts.roboto(color: color7, fontSize: 14,),
                        hintStyle: GoogleFonts.roboto(color: color7, fontSize: 15,),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 45.0,
                  ),
                  InkWell(
                    onTap: () {
                      authController.register(emailController.text.trim(), passwordController.text.trim());
                    },
                    child: Container(
                      height: 48.0,
                      width: 220,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.email_outlined, size: 24, color: color2,),
                          const SizedBox(width: 15.0,),
                          Text("Sign up with Email", style: GoogleFonts.patrickHand(color: color2, fontSize: 16, fontWeight: FontWeight.bold),),
                          const SizedBox(width: 15.0,),
                        ],
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: color7,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  InkWell(
                    onTap: () {
                      authController.signInWithGoogle();
                    },
                    child: Container(
                      height: 48.0,
                      width: 220,
                      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/google.png', height : 24, width: 24,),
                          const SizedBox(width: 15.0,),
                          Text("Sign up with Google", style: GoogleFonts.patrickHand(color: color2, fontSize: 16, fontWeight: FontWeight.bold),),
                          const SizedBox(width: 15.0,),
                        ],
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        gradient: LinearGradient(
                          colors: GradientColors.happyAcid,
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text("Already a User? Click here", style: GoogleFonts.patrickHand(fontSize: 13, color: color7),),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}