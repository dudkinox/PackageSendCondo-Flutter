import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../main.dart';

Future<void> showNotification(String room) async {
  const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
    'CITYZEN CONDO',
    'แจ้งเตือนสำคัญ',
    'แจ้งเตือนสำคัญ',
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
  );
  const NotificationDetails plateformChanelDetail = NotificationDetails(
    android: androidNotificationDetails,
  );

  var date = DateTime.now();

  await flutterLocalNotificationsPlugin.show(
    0,
    'Cityzen condo ' + date.toString(),
    'มีแจ้งเตือนจากทางนิติ! ห้องของคุณ : ' + room,
    plateformChanelDetail,
  );
}
