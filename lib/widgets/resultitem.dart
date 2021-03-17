import 'package:doctor/screens/doctorprofile.dart';
import 'package:doctor/widgets/favicon.dart';
import 'package:doctor/widgets/reviewitem.dart';
import 'package:flutter/material.dart';



class ResultItem extends StatefulWidget {

final String drName;
final String type;
final double rating;
final String image;
final int reviews;
final double fee;
final String currency;
final String location;

ResultItem({this.drName, this.type,this.rating, this.image, this.reviews, this.fee, this.location, this.currency});

  @override
  _ResultItemState createState() => _ResultItemState();
}

class _ResultItemState extends State<ResultItem> {

bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 125.0,
                margin: EdgeInsets.only(right: 10.0),
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
                    style: TextStyle(color: Color(0xff00BBDC), fontSize: 18.0, fontWeight: FontWeight.bold, height: 1.5),
                  ),
                  ReviewItem(widget.rating, widget.reviews),
                  Text(
                    '${widget.location}',
                    style: TextStyle(color: Color(0xff18435A), fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Fee: ${widget.fee.toString()} ${widget.currency}',
                    style: TextStyle(color: Color(0xff18435A), fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Add To',
                style: TextStyle(color: Color(0xff00BBDC), fontSize: 18.0, fontWeight: FontWeight.normal, height: 1.5),
              ),
              FavIcon(),
              SizedBox(width: MediaQuery.of(context).size.width/4),
              Text(
                'Book',
                style: TextStyle(color: Color(0xff00BBDC), fontSize: 18.0, fontWeight: FontWeight.normal, height: 1.5),
              ),
              IconButton(
                icon: Icon(Icons.calendar_today),
                color: Color(0xff00BBDC),
                iconSize: 25.0,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {return DoctorProfile();}));
                }
              ),
            ],
          ),
        ],
      ),
    );
  }
}