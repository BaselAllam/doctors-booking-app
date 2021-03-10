import 'package:flutter/material.dart';




class AppointmentItem extends StatefulWidget {

final String drName;
final String type;
final String date;
final String time;
final String image;
final String className;

AppointmentItem({this.drName, this.type,this.date, this.time, this.image, this.className});

  @override
  _AppointmentItemState createState() => _AppointmentItemState();
}

class _AppointmentItemState extends State<AppointmentItem> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 125.0,
            width: MediaQuery.of(context).size.width/4,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(widget.image),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dr: ${widget.drName}',
                style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold, height: 1.5),
              ),
              Text(
                widget.type,
                style: TextStyle(color: Color(0xff00BBDC), fontSize: 16.0, fontWeight: FontWeight.bold, height: 1.5),
              ),
              Text(
                '${widget.date} \n${widget.time}',
                style: TextStyle(color: Color(0xff00BBDC), fontSize: 16.0, fontWeight: FontWeight.bold, height: 1.5),
              ),
              widget.className == 'Upcoming' ? SizedBox() :
              Text(
                'Revisit at:\n Mon 20 - Feb - 2021',
                style: TextStyle(color: Color(0xff18435A), fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}