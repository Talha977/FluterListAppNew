import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

FlutterLocalNotificationsPlugin notificationsPlugin =
    FlutterLocalNotificationsPlugin();

class Notificationsscreen extends StatefulWidget {
  const Notificationsscreen({Key key}) : super(key: key);

  @override
  _NotificationsscreenState createState() => _NotificationsscreenState();
}

class _NotificationsscreenState extends State<Notificationsscreen> {
  @override
  void initState() {
    initializeSetting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notifications for android only'),
        ),
        body: Container(
            child: Row(children: [
          Text('Press Icon to send notification after 5 seconds'),
          IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                displayNotification(
                    'Test',
                    tz.TZDateTime.now(tz.local)
                        .add(const Duration(seconds: 5)));
              }),
        ])));
  }

  Future<void> displayNotification(String title, DateTime dateTime) async {
    notificationsPlugin.zonedSchedule(
        0,
        'Alert',
        'This is a test body',
        tz.TZDateTime.from(dateTime, tz.local),
        const NotificationDetails(
          android: AndroidNotificationDetails(
              'channel id', 'channel description', 'channel name'),
        ),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
  }
}

void initializeSetting() async {
  var initializeAndroid = const AndroidInitializationSettings('logo');
  var initializeSetting = InitializationSettings(android: initializeAndroid);
  await notificationsPlugin.initialize(initializeSetting);
}
