import 'package:flutter/material.dart';



class FavIcon extends StatefulWidget {
  @override
  _FavIconState createState() => _FavIconState();
}

class _FavIconState extends State<FavIcon> {

bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(pressed == false ? Icons.favorite_border : Icons.favorite),
      color: Color(0xff00BBDC),
      iconSize: 20.0,
      onPressed: () {
        setState(() {
          pressed = !pressed;
        });
      }
    );
  }
}