import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


void main() => runApp(HomeScreen());

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState () => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final String title = "FCM Push Notification";
  final FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();

  @override
  void initState() {
    super.initState();

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async{
        print(message);
        _showDialog(message);
      },
      onLaunch: (Map<String, dynamic> message) async{
        print("On launch called");
      },
      onResume: (Map<String, dynamic> message) async{
        print("On resume called");
      },
    );

    _firebaseMessaging.requestNotificationPermissions(
      const IosNotificationSettings(sound: true, badge: true, alert: true)
    );

    _firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
        print("Settings registered: $settings");
    });

    _firebaseMessaging.getToken()
    .then((String token) => print("Token $token"));
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

  void _showDialog(Map<String, dynamic> message) {
    showDialog(
      context:context,
      builder: (_) {
        _buildDialog(context, message);
      }
    );
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
