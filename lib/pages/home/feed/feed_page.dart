import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nofapper/constants/colors.dart';
import 'image_fetcher.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color7,
            ),
            child: Text('Handpicked Images Just for You', style: GoogleFonts.patrickHand(fontSize: 18, color: color2, fontWeight: FontWeight.bold),),
          ),
          const SizedBox(
            height: 20,
          ),
          ImageFetch(),
        ],
      ),
    );
  }
}

