import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show utf8, json;
import 'version-api.dart';


void main() => runApp(HomeScreen());

class HomeScreen extends StatefulWidget {
  HomeScreen();

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

  String version = "";

  void _fetchVersionApi(BuildContext context) async {
    try {
      
      /* manual serialize json, this method suitable for small application. But have to type more logic */
      var response = await http.get("https://api.payfazz.com/v2/products/version");
      var responseJSON = VersionAPI.fromJson(json.decode(response.body));

      /* automaticly serialize json not yet */


      setState(() {
        version = responseJSON.version.toString();
      });
    } catch(e) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          action: SnackBarAction(
            label: 'UNDO',
            onPressed: Scaffold.of(context).hideCurrentSnackBar,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Http Request",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Http Request")
        ),
        body: Builder(
          builder: (context) => Center(
            child: Column(
              children: <Widget>[
                Text(version),
                RaisedButton(
                  onPressed: () => _fetchVersionApi(context),
                  child: Text("Fetch Data"),
                ),
              ]
            ),
          ),
        ),
      ),
    );
  } 

}