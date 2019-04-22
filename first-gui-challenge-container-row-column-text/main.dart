import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.cyan,
      accentColor: Colors.orange,
    ),
    home: Scaffold(
      appBar: AppBar(
        title: Text(
          "FIRST UI CHALLENGE",
          style: TextStyle(fontSize: 24.0, color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
              print("Buton basıldı!"),
            },
        child: Icon(
          Icons.phone,
          color: Colors.white,
          //size: 48,
        ),
      ),
      //  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,

        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(2),
                padding: EdgeInsets.all(20),
                color: Colors.blue.shade200,
                child: Text(
                  "E",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.all(2),
                padding: EdgeInsets.all(20),
                color: Colors.blue.shade400,
                child: Text(
                  "M",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.all(2),
                padding: EdgeInsets.all(20),
                color: Colors.blue.shade600,
                child: Text(
                  "R",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.all(2),
                padding: EdgeInsets.all(20),
                color: Colors.blue.shade700,
                child: Text(
                  "E",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),Container(
            margin: EdgeInsets.all(2),
            padding: EdgeInsets.all(20),
            color: Colors.blue.shade100,
            child: Text(
              "S",
              style: TextStyle(fontSize: 20),
            ),

          ),Container(
            margin: EdgeInsets.all(2),
            padding: EdgeInsets.all(20),
            color: Colors.blue.shade200,
            child: Text(
              "E",
              style: TextStyle(fontSize: 20),
            ),

          ),Container(
            margin: EdgeInsets.all(2),
            padding: EdgeInsets.all(20),
            color: Colors.blue.shade300,
            child: Text(
              "R",
              style: TextStyle(fontSize: 20),
            ),

          ),Container(
            margin: EdgeInsets.all(2),
            padding: EdgeInsets.all(20),
            color: Colors.blue.shade400,
            child: Text(
              "B",
              style: TextStyle(fontSize: 20),
            ),

          ),Container(
            margin: EdgeInsets.all(2),
            padding: EdgeInsets.all(20),
            color: Colors.blue.shade500,
            child: Text(
              "E",
              style: TextStyle(fontSize: 20),
            ),

          ),Container(
            margin: EdgeInsets.all(2),
            padding: EdgeInsets.all(20),
            color: Colors.blue.shade600,
            child: Text(
              "S",
              style: TextStyle(fontSize: 20),
            ),

          ),Container(
            margin: EdgeInsets.all(2),
            padding: EdgeInsets.all(20),
            color: Colors.blue.shade700,
            child: Text(
              "T",
              style: TextStyle(fontSize: 20),
            ),

          ),
        ],
      ),
    ),
  ));
}
