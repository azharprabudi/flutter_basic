import 'package:flutter/material.dart';
import 'custom-banner.dart';

void main() => runApp(
  HomeScreen(
    name: "Inherited Widget"
  )
);

class HomeScreen extends StatefulWidget {
  final String name;
  HomeScreen({ this.name });

  @override
  HomeScreenState createState() => HomeScreenState(name: this.name);
}

class HomeScreenState extends State<HomeScreen> {
  final String name;
  int count = 0;

  HomeScreenState({ this.name });

  _setCounterCount({ @required bool isAdd }) {
    setState(() {
      if (isAdd) {
        count = this.count + 1;
      } else {
        count = this.count - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: this.name,
      home: Scaffold(
        appBar: AppBar(
          title: Text(this.name)
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              CustomBanner(count: this.count),
              RaisedButton(
                child: Text("Decrement Number"),
                onPressed: () =>  _setCounterCount(isAdd: false)
              ),
              RaisedButton(
                child: Text("Increment Number"),
                onPressed: () => _setCounterCount(isAdd: true)
              )
            ]
          ),
        ),
      )
    );
  }
}