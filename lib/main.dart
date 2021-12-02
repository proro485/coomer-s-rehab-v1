import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nofapper/controllers/admob_service.dart';
import 'package:nofapper/controllers/user_data_controller.dart';
import 'package:nofapper/pages/loading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants/constants.dart';
import 'controllers/auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp().then((value) {
    Get.put(AuthController());
  });
  // AdMobService.initialize();
  userDataController = Get.put(UserDataController());
  Paint.enableDithering = true;
  sharedPreferences = await SharedPreferences.getInstance();
  initializeSetting();
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        )
    );
    return const Loading();
  }
}

void initializeSetting () async {
  var initializeAndroid = const AndroidInitializationSettings('icon');
  var initializeSetting = InitializationSettings(android: initializeAndroid);
  notificationsPlugin.initialize(initializeSetting);
}