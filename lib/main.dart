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
      debugShowCheckedModeBanner: false,
      home: MyPet(title: '我的寵物'),
    );
  }
}

class MyPet extends StatelessWidget {
  MyPet({Key key, this.title}) : super(key: key);
  final String title;

  Widget _dialogBuilder(BuildContext context, Pet pet) {
    return SimpleDialog(
      children: [
        Container(
          width: 80.0,
          height: 120.0,
        )
      ],
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

class Pet {
  const Pet(
      {this.name, this.description, this.gender, this.color, this.imageUrl});
  final String name;
  final String description;
  final String gender;
  final Color color;
  final String imageUrl;
}

final List<Pet> pets = <Pet>[
  Pet(
      name: 'NiChan',
      description: '一支很可愛的柴犬',
      gender: '母',
      color: Colors.brown,
      imageUrl: ''),
  Pet(
      name: '麻吉',
      description: '一隻壞卯咪',
      gender: '公',
      color: Colors.black,
      imageUrl: ''),
  Pet(
      name: '亮亮',
      description: '三腳貓',
      gender: '公',
      color: Colors.amber,
      imageUrl: ''),
];
