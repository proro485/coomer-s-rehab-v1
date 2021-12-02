import 'package:get/get.dart';
import 'package:nofapper/constants/constants.dart';
import 'package:nofapper/data/user.dart';
import 'notification.dart';

class UserDataController extends GetxController {
  late UserData userData;

  @override
  void onReady() {
    super.onReady();
    Get.find<UserDataController>().userData = UserData();
  }

  Future<void> updatingWhenLogin (String userId, String username, int currentStreak, int maxStreak, int currentLevel, int currentGoal, int startTime, bool premium) async {
    userData.userId = userId;
    userData.username = username;
    userData.currentStreak = currentStreak;
    userData.maxStreak = maxStreak;
    userData.currentLevel = currentLevel;
    userData.currentGoal = currentGoal;
    userData.startTime = startTime;
    userData.premium = premium;
    update();
  }

  Future<void> updatingWhenCoomed () async {
    userData.currentStreak = 0;
    userData.currentLevel = 1;
    userData.currentGoal = 1;
    userData.startTime = DateTime.now().millisecondsSinceEpoch;
    await notificationsPlugin.cancelAll();
    displayNotification();
    await sharedPreferences!.setInt('currentStreak', userData.currentStreak);
    await sharedPreferences!.setInt('currentGoal', userData.currentGoal);
    await sharedPreferences!.setInt('currentLevel', userData.currentLevel);
    await sharedPreferences!.setInt('startTime', userData.startTime);
    update();
    sync(true);
    syncRealtime(true);
  }

  Future<void> updateWhenSuccess() async {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(userData.startTime);
    if (DateTime.now().difference(dateTime).inDays - Get.find<UserDataController>().userData.currentStreak >= 1) {
      Get.find<UserDataController>().userData.currentStreak += DateTime.now().difference(dateTime).inDays - Get.find<UserDataController>().userData.currentStreak;
      if (Get.find<UserDataController>().userData.currentStreak> Get.find<UserDataController>().userData.maxStreak) {
        Get.find<UserDataController>().userData.maxStreak = Get.find<UserDataController>().userData.currentStreak;
        levelAndCurrentGoal(Get.find<UserDataController>().userData.currentStreak, true);
        sharedPreferences!.setInt('currentStreak', Get.find<UserDataController>().userData.currentStreak);
        sharedPreferences!.setInt('currentGoal', Get.find<UserDataController>().userData.currentGoal);
        sharedPreferences!.setInt('currentLevel', Get.find<UserDataController>().userData.currentLevel);
        sharedPreferences!.setInt('maxStreak', Get.find<UserDataController>().userData.maxStreak);
      } else {
        levelAndCurrentGoal(Get.find<UserDataController>().userData.currentStreak, true);
        sharedPreferences!.setInt('currentStreak', Get.find<UserDataController>().userData.currentStreak);
        sharedPreferences!.setInt('currentGoal', Get.find<UserDataController>().userData.currentGoal);
        sharedPreferences!.setInt('currentLevel', Get.find<UserDataController>().userData.currentLevel);
      }
      update();
      sync(false);
      syncRealtime(false);
    }
  }

  void sync(bool coomed) async {
    try {
      if (coomed) {
        users.doc(Get.find<UserDataController>().userData.userId).update({
          'currentStreak': Get.find<UserDataController>().userData.currentStreak,
          'maxStreak': Get.find<UserDataController>().userData.maxStreak,
          'currentLevel': Get.find<UserDataController>().userData.currentLevel,
          'currentGoal': Get.find<UserDataController>().userData.currentGoal,
          'startTime': Get.find<UserDataController>().userData.startTime,
        });
      } else {
        users.doc(Get.find<UserDataController>().userData.userId).update({
          'currentStreak': Get.find<UserDataController>().userData.currentStreak,
          'maxStreak': Get.find<UserDataController>().userData.maxStreak,
          'currentLevel': Get.find<UserDataController>().userData.currentLevel,
          'currentGoal': Get.find<UserDataController>().userData.currentGoal,
        });
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void syncRealtime(bool haveCoomed) async {
    if (haveCoomed) {
      try {
        database.child('users/${Get.find<UserDataController>().userData.userId}').update({
          'startTime': Get.find<UserDataController>().userData.startTime,
        });
      } catch (e) {
        Get.snackbar(
          "Error",
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  int levelAndCurrentGoal (int day, bool tochange) {
    if (!tochange) {
      if(day < 1) {
        return 1;
      } else if (day < 7) {
        return 2;
      } else if (day < 15) {
        return 3;
      } else if (day < 30) {
        return 4;
      } else if (day < 45) {
        return 5;
      } else if (day < 80) {
        return 6;
      } else if (day < 120) {
        return 7;
      } else if (day < 180) {
        return 8;
      }
      return 9;
    } else {
      if(day < 1) {
        Get.find<UserDataController>().userData.currentLevel = 1;
        Get.find<UserDataController>().userData.currentGoal = 1;
        return 1;
      } else if (day < 7) {
        Get.find<UserDataController>().userData.currentGoal = 7;
        Get.find<UserDataController>().userData.currentLevel = 2;
        return 2;
      } else if (day < 15) {
        Get.find<UserDataController>().userData.currentGoal = 15;
        Get.find<UserDataController>().userData.currentLevel = 3;
        return 3;
      } else if (day < 30) {
        Get.find<UserDataController>().userData.currentGoal = 30;
        Get.find<UserDataController>().userData.currentLevel = 4;
        return 4;
      } else if (day < 45) {
        Get.find<UserDataController>().userData.currentGoal = 45;
        Get.find<UserDataController>().userData.currentLevel = 5;
        return 5;
      } else if (day < 80) {
        Get.find<UserDataController>().userData.currentGoal = 80;
        Get.find<UserDataController>().userData.currentLevel = 6;
        return 6;
      } else if (day < 120) {
        Get.find<UserDataController>().userData.currentGoal = 120;
        Get.find<UserDataController>().userData.currentLevel = 7;
        return 7;
      } else if (day < 180) {
        Get.find<UserDataController>().userData.currentGoal = 180;
        Get.find<UserDataController>().userData.currentLevel = 8;
        return 8;
      } else {
        Get.find<UserDataController>().userData.currentGoal = 365;
        Get.find<UserDataController>().userData.currentLevel = 9;
      }
      return 9;
    }
  }
}