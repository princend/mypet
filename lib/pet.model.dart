import 'package:flutter/material.dart';

class Pet {
  Pet(
      {this.name,
      this.description,
      this.gender,
      this.color,
      this.imageUrl,
      this.likes});
  final String name;
  final String description;
  final String gender;
  final Color color;
  final String imageUrl;
  int likes;
}

final List<Pet> pets = <Pet>[
  Pet(
      name: 'NiChan',
      description: '一支很可愛的柴犬，超級乖，不太會亂叫發病',
      gender: '母',
      color: Color.fromRGBO(178, 128, 90, 1),
      likes: 0,
      imageUrl:
          'https://media.discordapp.net/attachments/721282789361713155/766328033174618112/IMG_20200730_073620.jpg?width=622&height=467'),
  Pet(
      name: '麻吉',
      description: '一隻壞卯咪，每次都會搶亮亮的罐頭，並且發出嘶嘶聲',
      gender: '公',
      color: Color.fromRGBO(54, 50, 40, 1),
      likes: 0,
      imageUrl:
          'https://cdn.discordapp.com/attachments/721282789361713155/766328353501478982/Screenshot_20201015-235458.png'),
  Pet(
      name: '亮亮',
      description: '三腳貓，年幼時被捕鼠夾夾斷了左前腿',
      gender: '公',
      color: Color.fromRGBO(186, 148, 111, 1),
      likes: 0,
      imageUrl:
          'https://cdn.discordapp.com/attachments/721282789361713155/766327831642767380/IMG_20200222_131900.jpg'),
];
