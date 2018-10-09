import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


void main() => runApp(LocalNotification());

class LocalNotification extends StatefulWidget {
  @override
  LocalNotificationState createState () => LocalNotificationState();

}

class LocalNotificationState extends State<LocalNotification> {
  FlutterLocalNotificationsPlugin mFlutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();

  @override
  initState() {
    super.initState();

    /*
    
    initialize for push notification setting
    
    */
    var android = new AndroidInitializationSettings("@mipmap/ic_launcher");
    var ios = new IOSInitializationSettings();
    var initializeSetting = new InitializationSettings(android, ios);
    mFlutterLocalNotificationsPlugin.initialize(initializeSetting, selectNotification: onSelectNotification);

  }

  Future _printOne() => Future.delayed(Duration(seconds: 1), () => true);

  // Future onSelectedNotification(String payload) => Future.delayed(Duration(seconds: 1), () => true);
  Future onSelectNotification(String payload) async {
    print('notification payload: ' + payload);
    await _printOne();
  }

  @override
  Widget build(BuildContext build) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Push Notification",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Push Notification"),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: _showNotification,
            child: Text("Click Me")
          ),
        )
      )
    );
  }

   Future _showNotification() async {
     /*
     
     grouping push notification should be use for specific group


     */
      var androidChannel = new AndroidNotificationDetails("CHANNEL_ID", "CHANNEL_NAME", "CHANNEL_DESCRIPTION", importance: Importance.Max, priority: Priority.High);
      var iosChannel = new IOSNotificationDetails();
      var platformMergingChannel = new NotificationDetails(androidChannel, iosChannel);
      await mFlutterLocalNotificationsPlugin.show(0, "Notification", "Hello World", platformMergingChannel, payload: "Push Notification");
  }

}


