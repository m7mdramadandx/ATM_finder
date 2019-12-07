import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('My first App'),
          backgroundColor: Colors.transparent,
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('images/me.png'),
            ),
            Text(
              'Muhammad Ramadan',
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 34,
                  fontFamily: 'Nickainley',
                  fontWeight: FontWeight.bold),
            ),
            Text(
              ' FLUTTER DEVELOPER',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  wordSpacing: 10.0),
            ),
            SizedBox(
              width: 250,
              child: Divider(
                color: Colors.white70,
                thickness: 0.7,

              ),
            ),
            Container(
              color: Colors.blueAccent,
              margin: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 10),
              padding: EdgeInsets.all(5.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.email, color: Colors.white),
                  Text('  mhmdrmdandx@gmail.com', style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ) )
                ],
              ),
            ),
            Container(
              color: Colors.blueAccent,
              margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10),
              padding: EdgeInsets.all(5.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.phone, color: Colors.white),
                  Text(' +020 127 359 2309', style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ) )
                ],
              ),
            ),
          ],
        )),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.transparent,
          child: Icon(Icons.add),
          onPressed: () {
            print('Notch');
          },
        ),
      ),
    );
  }
}
