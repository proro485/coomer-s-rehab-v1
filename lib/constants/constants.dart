import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nofapper/controllers/auth.dart';
import 'package:nofapper/controllers/user_data_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

AuthController authController = AuthController.instance;
FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
final database = FirebaseDatabase.instance.reference();
int indexTopX = 0;
List topX = [10, 25, 50, 100, 250, 500, 1000];
Stream leaderboardStream = database.child('users').orderByChild('startTime').limitToFirst(topX[indexTopX]).onValue;
final imagesStream = database.child('images').orderByKey().onValue;
final imageOfTheDayStream = database.child('imageOfTheDay').onValue;
FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();
GoogleSignIn googleSign = GoogleSignIn();
CollectionReference users = FirebaseFirestore.instance.collection('users');
SharedPreferences? sharedPreferences;
late UserDataController userDataController;
var authResult;
var authResultGoogle;
List<String> levelName = ["Coomer", "Withered Wojak", "Brainlet", "Cognitive Brainlet", "Happy Wojak", "BigBrain Wojak",
  "Chad", "BigBrain Chad", "GigaChad"];