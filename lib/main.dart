import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

var data = "azhar";

void main() => runApp(HomeScreen());

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState () => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  
  FlutterLocalNotificationsPlugin mFlutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();

  final String title = "FCM Push Notification";
  final FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();

  @override
  void initState() {
    super.initState();

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async{
        print("On Message Kondel $message");
        _showNotification(message["notification"]["title"], message["notification"]["body"], "test");
      },
      onLaunch: (Map<String, dynamic> message) async{
        print("On Launch Kondel $message");
      },
      onResume: (Map<String, dynamic> message) async{
        print("On Resume Kondel $message");
      },
    );
  
    /*
    
    IOS FUNCTION
    _firebaseMessaging.requestNotificationPermissions(
      const IosNotificationSettings(sound: true, badge: true, alert: true)
    );

    _firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
        print("Settings registered: $settings");
    });

    _firebaseMessaging.getToken()
    .then((String token) => print("Token $token"));
    
    */

    var android = new AndroidInitializationSettings("@mipmap/ic_launcher");
    var ios = new IOSInitializationSettings();
    var initializeSetting = new InitializationSettings(android, ios);
    mFlutterLocalNotificationsPlugin.initialize(initializeSetting, selectNotification: onSelectNotification);
  }

  Future _printIfSuccessNotified() {
    return Future.delayed(Duration(seconds: 1));
  }

  Future onSelectNotification(String payload) async {
    print(payload);
    await _printIfSuccessNotified();
  }

   Widget _buildDialog(BuildContext context, Map<String, dynamic> item) {
    String title = item["notification"]["title"]; 

    return new AlertDialog(
      content: new Text("Item ${title} has been updated"),
      actions: <Widget>[
        new FlatButton(
          child: const Text('CLOSE'),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
        new FlatButton(
          child: const Text('SHOW'),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ],
    );
  }

  Future _showNotification(String title, String content, String payload) async {
    /*
    
    grouping push notification should be use for specific group
    */
    var androidChannel = new AndroidNotificationDetails("CHANNEL_ID", "CHANNEL_NAME", "CHANNEL_DESCRIPTION", importance: Importance.Max, priority: Priority.High);
    var iosChannel = new IOSNotificationDetails();

    var platformMergingChannel = new NotificationDetails(androidChannel, iosChannel);
    await mFlutterLocalNotificationsPlugin.show(0, title, content, platformMergingChannel, payload: payload);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: this.title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(this.title)
        ),
        body: Center(
          child: Text(this.title)
        )
      )
    );
  }
}
