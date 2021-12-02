import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nofapper/constants/colors.dart';
import 'package:nofapper/pages/home/front/bottom_widget.dart';
import 'package:nofapper/pages/home/front/top_widget.dart';

class Front extends StatelessWidget {
  const Front({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 15.0,
          ),
          const TopWidget(),
          const SizedBox(
            height: 15.0,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            decoration: BoxDecoration(
              color: color7,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text("Image of the Day", style: GoogleFonts.patrickHand(fontSize: 18, fontWeight: FontWeight.bold, color: color2),),
          ),
          const SizedBox(
            height: 15.0,
          ),
          const BottomWidget(),
        ],
      ),
    );
  }
}
