import 'package:flutter/material.dart';
import 'package:mypet/pet.model.dart';
import 'package:mypet/petdialog.dart';

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
      debugShowCheckedModeBanner: false,
      home: MyPet(title: '我的寵物'),
    );
  }
}

class MyPet extends StatelessWidget {
  MyPet({Key key, this.title}) : super(key: key);
  final String title;

  Widget _dialogBuilder(BuildContext context, Pet pet) {
    return Petdialog(
      pet: pet,
    );
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => showDialog(
          context: context,
          builder: (context) => _dialogBuilder(context, pets[index])),
      child: ListTile(
        title: Text(
          pets[index].name,
          style: TextStyle(
              color: pets[index].gender == '公' ? Colors.blue : Colors.pink,
              fontSize: 20),
        ),
        leading: Icon(
          Icons.pets,
          color: pets[index].color,
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        this.title,
        textAlign: TextAlign.center,
      )),
      body: ListView.builder(
        itemCount: pets.length,
        itemExtent: 60,
        itemBuilder: _listItemBuilder,
      ),
    );
  }
}
