import 'package:nofapper/constants/constants.dart';

class UserData {
  String userId = sharedPreferences!.getString('userId') ?? 'error';
  String username = sharedPreferences!.getString('username') ?? 'error';
  int maxStreak = sharedPreferences!.getInt('maxStreak') ?? 0;
  int currentLevel = sharedPreferences!.getInt('currentLevel') ?? 1;
  int currentStreak = sharedPreferences!.getInt('currentStreak') ?? 0;
  int currentGoal = sharedPreferences!.getInt('currentGoal') ?? 1;
  int startTime = sharedPreferences!.getInt('startTime') ?? DateTime.now().millisecondsSinceEpoch;
  bool premium = sharedPreferences!.getBool('premium') ?? false;
}