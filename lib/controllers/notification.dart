import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:nofapper/constants/constants.dart';

Future<void> displayNotification () async {
  await notificationsPlugin.periodicallyShow(
      0,
      "Coomer's Rehab",
      'Keep going on continue the streak.',
      RepeatInterval.daily,
      const NotificationDetails(
        android: AndroidNotificationDetails('channel id', 'channel name', playSound: true),
      ),
      androidAllowWhileIdle: true
  );
}