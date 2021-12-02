import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nofapper/constants/constants.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:nofapper/controllers/notification.dart';
import 'package:nofapper/controllers/user_data_controller.dart';
import 'package:nofapper/pages/home/home.dart';
import 'package:nofapper/pages/login/login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nofapper/pages/setup/setup.dart';


class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> firebaseUser;
  late Rx<GoogleSignInAccount?> googleSignInAccount;
  bool isNewUser = false;
  bool loggedIn = false;

  @override
  void onReady() {
    super.onReady();

    firebaseUser = Rx<User?>(auth.currentUser);
    googleSignInAccount = Rx<GoogleSignInAccount?>(googleSign.currentUser);

    firebaseUser.bindStream(auth.userChanges());
    if(!isNewUser) {
      ever(firebaseUser, _setInitialScreen);
    }

    googleSignInAccount.bindStream(googleSign.onCurrentUserChanged);
    if(!isNewUser) {
      ever(googleSignInAccount, _setInitialScreenGoogle);
    }
  }

  _setInitialScreen(User? user) async {
    if (user == null) {
      loggedIn = false;
      Get.offAll(() => const Login());
    } else if (!loggedIn && !isNewUser){
      loggedIn = true;
      Future.delayed(const Duration(milliseconds: 1200), (){
        Get.offAll(() => Home());
      });
    }
  }

  _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) async {
    if (googleSignInAccount == null) {
      loggedIn = false;
      Get.offAll(() => const Login());
    } else if (!loggedIn && !isNewUser){
      loggedIn = true;
      Future.delayed(const Duration(milliseconds: 1200), (){
        Get.offAll(() => Home());
      });
    }
  }

  void signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSign.signIn();

      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        authResultGoogle = await auth.signInWithCredential(credential);
        final user = authResultGoogle.user;

        if(authResultGoogle.additionalUserInfo.isNewUser) {
          isNewUser = true;
          Get.offAll(() => const Setup());
        } else {
          users.doc(user.uid).get().then((dataSnapshot) async {
            await sharedPreferences!.setString('userId', dataSnapshot.get('userId'));
            await sharedPreferences!.setString('username', dataSnapshot.get('username'));
            await sharedPreferences!.setInt('currentStreak', dataSnapshot.get('currentStreak'));
            await sharedPreferences!.setInt('maxStreak', dataSnapshot.get('maxStreak'));
            await sharedPreferences!.setInt('currentLevel', dataSnapshot.get('currentLevel'));
            await sharedPreferences!.setInt('currentGoal', dataSnapshot.get('currentGoal'));
            await sharedPreferences!.setInt('startTime', dataSnapshot.get('startTime'));
            await sharedPreferences!.setBool('premium', dataSnapshot.get('premium'));
            await notificationsPlugin.cancelAll();
            await displayNotification();
            Get.find<UserDataController>().updatingWhenLogin(
              dataSnapshot.get('userId'),
              dataSnapshot.get('username'),
              dataSnapshot.get('currentStreak'),
              dataSnapshot.get('maxStreak'),
              dataSnapshot.get('currentLevel'),
              dataSnapshot.get('currentGoal'),
              dataSnapshot.get('startTime'),
              dataSnapshot.get('premium'),
            );
            Get.find<UserDataController>().updateWhenSuccess();
          });
        }
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void register(String email, password) async {
    try {
      isNewUser = true;
      authResult = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.offAll(() => const Setup());
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void login(String email, password) async {
    try {
      authResult = await auth.signInWithEmailAndPassword(email: email, password: password);
      final user = authResult.user;
      users.doc(user.uid).get().then((dataSnapshot) async {
        await sharedPreferences!.setString('userId', dataSnapshot.get('userId'));
        await sharedPreferences!.setString('username', dataSnapshot.get('username'));
        await sharedPreferences!.setInt('currentStreak', dataSnapshot.get('currentStreak'));
        await sharedPreferences!.setInt('maxStreak', dataSnapshot.get('maxStreak'));
        await sharedPreferences!.setInt('currentLevel', dataSnapshot.get('currentLevel'));
        await sharedPreferences!.setInt('currentGoal', dataSnapshot.get('currentGoal'));
        await sharedPreferences!.setInt('startTime', dataSnapshot.get('startTime'));
        await sharedPreferences!.setBool('premium', dataSnapshot.get('premium'));
        await notificationsPlugin.cancelAll();
        await displayNotification();
        Get.find<UserDataController>().updatingWhenLogin(
          dataSnapshot.get('userId'),
          dataSnapshot.get('username'),
          dataSnapshot.get('currentStreak'),
          dataSnapshot.get('maxStreak'),
          dataSnapshot.get('currentLevel'),
          dataSnapshot.get('currentGoal'),
          dataSnapshot.get('startTime'),
          dataSnapshot.get('premium'),
        );
        Get.find<UserDataController>().updateWhenSuccess();
      });
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() async {
    await auth.signOut();
  }

  void delete() async {
    String userId = Get.find<UserDataController>().userData.userId;
    auth.currentUser!.delete();
    users.doc(userId).delete();
    database.child('users/$userId').remove();
  }
}