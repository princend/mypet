import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mypet/pet.model.dart';

class Petdialog extends StatefulWidget {
  Petdialog({Key key, this.pet, @required this.notifyParent}) : super(key: key);
  final Function() notifyParent;
  final Pet pet;
  @override
  State<StatefulWidget> createState() => _DialogState();
}

class _DialogState extends State<Petdialog> {
  @override
  Widget build(BuildContext context) {
    ThemeData localTheme = Theme.of(context);
    return SimpleDialog(
      contentPadding: EdgeInsets.zero,
      children: [
        Image.network(widget.pet.imageUrl, fit: BoxFit.fill),
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
                  widget.pet.name,
                  style: TextStyle(color: Colors.brown, fontSize: 26.0),
                  textAlign: TextAlign.center,
                ),
                IconButton(
                  onPressed: () => {
                    setState(() => {widget.pet.likes++, widget.notifyParent()})
                  },
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
                'Likes:${widget.pet.likes}',
                style: TextStyle(color: Colors.blue, fontSize: 26.0),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                '性別：${widget.pet.gender}',
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
                  Container(color: widget.pet.color, height: 15, width: 15)
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                widget.pet.description,
                style: localTheme.textTheme.bodyText1,
              ),
            ],
          ),
        )
      ],
    );
  }
}
