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
    ThemeData localTheme = Theme.of(context);
    var simpleDialog = SimpleDialog(
      contentPadding: EdgeInsets.zero,
      children: [
        Image.network(pet.imageUrl, fit: BoxFit.fill),
        Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                pet.name,
                style: TextStyle(color: Colors.brown, fontSize: 26.0),
                textAlign: TextAlign.center,
              ),
              Text(
                '性別：${pet.gender}',
                style: localTheme.textTheme.subtitle1
                    .copyWith(fontStyle: FontStyle.italic),
              ),
              Row(
                children: [
                  Text(
                    '毛色：',
                    style: localTheme.textTheme.subtitle1
                        .copyWith(fontStyle: FontStyle.italic),
                  ),
                  Container(color: pet.color, height: 15, width: 15)
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                pet.description,
                style: localTheme.textTheme.bodyText1,
              ),
            ],
          ),
        )
      ],
    );
    return simpleDialog;
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
      description: '一支很可愛的柴犬，超級乖，不太會亂叫發病',
      gender: '母',
      color: Color.fromRGBO(178, 128, 90, 1),
      imageUrl:
          'https://media.discordapp.net/attachments/721282789361713155/766328033174618112/IMG_20200730_073620.jpg?width=622&height=467'),
  Pet(
      name: '麻吉',
      description: '一隻壞卯咪，每次都會搶亮亮的罐頭，並且發出嘶嘶聲',
      gender: '公',
      color: Color.fromRGBO(54, 50, 40, 1),
      imageUrl:
          'https://cdn.discordapp.com/attachments/721282789361713155/766328353501478982/Screenshot_20201015-235458.png'),
  Pet(
      name: '亮亮',
      description: '三腳貓，年幼時被捕鼠夾夾斷了左前腿',
      gender: '公',
      color: Color.fromRGBO(186, 148, 111, 1),
      imageUrl:
          'https://cdn.discordapp.com/attachments/721282789361713155/766327831642767380/IMG_20200222_131900.jpg'),
];
