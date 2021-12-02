import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nofapper/constants/colors.dart';
import 'package:nofapper/controllers/user_data_controller.dart';
import 'package:nofapper/pages/home/feed/feed_page.dart';
import 'package:nofapper/pages/home/front/front.dart';
import 'package:nofapper/pages/home/profile/profile.dart';
import 'leaderboard/leaderboard.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Widget> pages = [
    const Front(),
    const FeedPage(),
    const Leaderboard(),
    const Profile(),
  ];

  @override
  void initState () {
    super.initState();
    Get.find<UserDataController>().updateWhenSuccess();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: color2,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text("Pain of Discipline is better than Pain of Regret", style: GoogleFonts.patrickHand(fontSize: 16, color: color7, fontWeight: FontWeight.w500),),
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(width: 1, color: color7,),),
              color: color3,
            ),
          ),
        ),
        body: TabBarView(
          children: pages,
          physics: const NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: Container(
          height: 55.0,
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(width: 1, color: color7,),),
            color: color3,
          ),
          child: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home, size: 26,)),
              Tab(icon: ImageIcon(AssetImage('assets/feed_icon.png'), size: 23,)),
              Tab(icon: Icon(Icons.leaderboard, size: 25)),
              Tab(icon: Icon(Icons.person, size: 26)),
            ], unselectedLabelColor: color2,
            labelColor: color7,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: color7,
          ),
        ),
      ),
    );
  }
}
