import 'package:flutter/material.dart';



class ReviewItem extends StatefulWidget {

final double rating;
final int reviews;

ReviewItem(this.rating, this.reviews);

  @override
  _ReviewItemState createState() => _ReviewItemState();
}

class _ReviewItemState extends State<ReviewItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // RatingBar(
        //   onRatingUpdate: (value){},
        //   direction: Axis.horizontal,
        //   initialRating: widget.rating,
        //   itemCount: 5,
        //   itemSize: 15,
        //   minRating: 1.0,
        //   maxRating: 5.0,
        //   ratingWidget: RatingWidget(
        //       full: Icon(
        //         Icons.star,
        //         color: Colors.yellow,
        //       ),
        //       half: Icon(
        //         Icons.star_half,
        //         color: Colors.yellow,
        //       ),
        //       empty: Icon(
        //         Icons.star_border,
        //         color: Colors.yellow,
        //       )),
        //   glowColor: Colors.yellow,
        //   unratedColor: Colors.grey,
        // ),
        Text(
          '  ( ${widget.reviews.toString()} Reviews)',
          style: TextStyle(color: Color(0xff00BBDC), fontSize: 18.0, fontWeight: FontWeight.bold, height: 1.5),
        ),
      ],
    );
  }
}