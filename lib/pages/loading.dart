import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nofapper/constants/colors.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: color2,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      home: Container(
        color: color2,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/logo.png', height: 250, width: 250,),
          const SizedBox(
            height: 80,
          ),
        ],
      ),
      ),
    );
  }
}
