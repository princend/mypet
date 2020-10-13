import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyPet(title: '我的寵物'),
    );
  }
}

class MyPet extends StatelessWidget {
  MyPet({Key key, this.title}) : super(key: key);
  final String title;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        this.title,
        textAlign: TextAlign.center,
      )),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              'NiChan',
              style: TextStyle(color: Colors.brown[300], fontSize: 20),
            ),
            leading: Icon(
              Icons.pets,
              color: Colors.brown,
            ),
          ),
          ListTile(
            title: Text(
              '麻吉',
              style: TextStyle(color: Colors.brown[300], fontSize: 20),
            ),
            leading: Icon(
              Icons.pets,
              color: Colors.black,
            ),
          ),
          ListTile(
            title: Text(
              '亮亮',
              style: TextStyle(color: Colors.brown[300], fontSize: 20),
            ),
            leading: Icon(
              Icons.pets,
              color: Colors.yellow,
            ),
          ),
        ],
      ),
    );
  }
}
