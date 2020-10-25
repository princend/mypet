import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mypet/pet.model.dart';

class Petdialog extends StatelessWidget {
  Petdialog({Key key, this.pet}) : super(key: key);
  final Pet pet;
  @override
  Widget build(BuildContext context) {
    ThemeData localTheme = Theme.of(context);
    return SimpleDialog(
      contentPadding: EdgeInsets.zero,
      children: [
        Image.network(pet.imageUrl, fit: BoxFit.fill),
        Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 16.0,
              ),
              Row(children: [
                Text(
                  pet.name,
                  style: TextStyle(color: Colors.brown, fontSize: 26.0),
                  textAlign: TextAlign.center,
                ),
                IconButton(
                  onPressed: () => {pet.likes++},
                  icon: Icon(
                    Icons.thumb_up,
                    color: Colors.blue,
                  ),
                ),
              ]),
              SizedBox(
                height: 16.0,
              ),
              Text(
                'Likes:${pet.likes}',
                style: TextStyle(color: Colors.blue, fontSize: 26.0),
              ),
              SizedBox(
                height: 16.0,
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
  }
}
