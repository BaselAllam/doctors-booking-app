import 'package:flutter/material.dart';
//import 'package:doctor/responsive/itemresponsive.dart';


class HomePageItem extends StatefulWidget {

final String title;
final String image;
final int index;

HomePageItem(this.title, this.image, this.index);

  @override
  _HomePageItemState createState() => _HomePageItemState();
}

class _HomePageItemState extends State<HomePageItem> {
  @override
  Widget build(BuildContext context) {
    //var data = MediaQuery.of(context);
    return Container(
     width: MediaQuery.of(context).size.width/2.5,
     // width: itemHeight(data),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        image: DecorationImage(
          image: NetworkImage(widget.image),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(Colors.black38, BlendMode.color)
        )
      ),
      alignment: Alignment.center,
      child: Text(
        widget.title,
        style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}