import 'package:flutter/material.dart';

    void main() => runApp(HomeScreen());

    class HomeScreen extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue
          ),
          title: "HomeScreen",
          home: Scaffold(
            appBar: AppBar(
              title: Text("HomeScreen")
            ),
            body: Container(
              /* height: 40.0, */
              color: Colors.yellow,
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Center(
                child: Column(
                  /*
                  mainAxisAlignment = alignItems in RN

                  more padding horizontal than space around
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  space around different with space evenly, there is more space than spaceEvenly
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  MainAxisAlignment.start
                  MainAxisAlignment.center
                  MainAxisAlignment.end

                  crossAxisAlignment = justifyContent in RN
                  
                  wrap content size
                  mainAxisSize: MainAxisSize.min,
                  */
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {},
                      child: Text("Show Me Your Money"),
                      splashColor: Colors.red,
                    ),
                    RaisedButton(
                      onPressed: () {},
                      child: Text("Ops !! Failed")
                    ),
                    RaisedButton(
                      onPressed: () {},
                      child: Text("Aw Digidaw ...")
                    ),
                  ],
                ),
              ),
            )
          )
        );
      }
    }

    