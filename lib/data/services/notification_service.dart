// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest_all.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
//
// import '../../application/strings/app_strings.dart';
//
// class NotificationService {
//   static const String _logoName = 'ic_stat_notification';
//   static const int notificationId = 2344;
//
//   final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//
//   final AndroidNotificationDetails _androidPrayerNotificationDetails = const AndroidNotificationDetails(
//     'Daily names notification channel ID',
//     'Names notifications',
//     channelDescription: 'Daily names notifications',
//     icon: _logoName,
//     importance: Importance.max,
//     priority: Priority.max,
//     playSound: true,
//   );
//
//   final DarwinNotificationDetails _iOSPrayerNotificationDetails = const DarwinNotificationDetails();
//
//   Future<void> setupNotification() async {
//     tz.initializeTimeZones();
//
//     if (Platform.isAndroid) {
//       _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();
//     }
//
//     AndroidInitializationSettings androidInitializationSettings = const AndroidInitializationSettings(_logoName);
//     DarwinInitializationSettings iOSInitializationSettings = const DarwinInitializationSettings(requestSoundPermission: true);
//
//     InitializationSettings initializationSettings = InitializationSettings(
//       android: androidInitializationSettings,
//       iOS: iOSInitializationSettings,
//     );
//
//     await _flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//     );
//   }
//
//   Future<void> prayerNotifications({required String names, required DateTime timeNotification}) async {
//     var tzDateNotification = tz.TZDateTime.from(timeNotification, tz.local);
//     try {
//       await _flutterLocalNotificationsPlugin.zonedSchedule(
//         notificationId,
//         AppStrings.appName,
//         names,
//         tzDateNotification,
//         NotificationDetails(
//           android: _androidPrayerNotificationDetails,
//           iOS: _iOSPrayerNotificationDetails,
//         ),
//         androidScheduleMode: AndroidScheduleMode.alarmClock,
//         matchDateTimeComponents: DateTimeComponents.time,
//         uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
//       );
//     } on PlatformException catch (e) {
//       debugPrint("Error scheduling notification: $e");
//     } catch (e) {
//       debugPrint("Unknown error: $e");
//     }
//   }
//
//   Future<void> cancelNotificationWithId() async {
//     await _flutterLocalNotificationsPlugin.cancel(notificationId);
//   }
// }
