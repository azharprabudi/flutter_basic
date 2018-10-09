import 'package:flutter/material.dart';

// void main() => runApp(HomeScreen(
//   name: ""
// ));

void main() => runApp(HomeScreen());


class HomeScreen extends StatefulWidget {
  // HomeScreen({ @required this.name });
  // final String name;
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  String owner = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "StateFull Flutter",
      home: Scaffold(
        appBar: AppBar(
          title: Text("StateFull Flutter")
        ),
        body: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Text(owner),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      if (owner == "") {
                        owner = "Azhar Prabudi";
                      } else {
                        owner = "";
                      }
                    });                
                  },
                  child: Text("Change Owner"),
                )
              ],
            )
          )
        ) 
      ),
    );
  } 
}
